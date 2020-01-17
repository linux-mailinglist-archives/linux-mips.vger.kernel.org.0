Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF02B14016F
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 02:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388176AbgAQB3q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 20:29:46 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:54112 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730070AbgAQB3q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Jan 2020 20:29:46 -0500
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1isGS9-0006Qz-2F; Fri, 17 Jan 2020 02:29:37 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 50722100C19; Fri, 17 Jan 2020 02:29:36 +0100 (CET)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, maz@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v1 1/2] genirq: Check for level based percpu irq
In-Reply-To: <20200117001706.40620-1-jiaxun.yang@flygoat.com>
References: <20200113101251.37471-1-jiaxun.yang@flygoat.com> <20200117001706.40620-1-jiaxun.yang@flygoat.com>
Date:   Fri, 17 Jan 2020 02:29:36 +0100
Message-ID: <875zhaeupr.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
> MIPS processors implemented their IPI IRQ and CPU interrupt line
> as level triggered IRQ. However, our current percpu_irq flow is trying
> do it in a level triggered manner.

So what are you trying to solve? The CPU uses level type and the per cpu
irq flow does the same. I can't find the problem with that.

> Thus we attempt to determine whether it is or not level triggered type by
> checking if both ack and eoi operation not exist. And handle it in
> mask/unmask way.

What? No. This is fundamentally wrong.

percpu interrupts which are used for IPIs/per CPU timers/PERF have the
the following semantics:

 1) No serialization required because the interrupt cannot happen
    concurrently on the same CPU

 2) The interrupt handler is strictly hard interrupt context. There
    can't be a threaded handler associated to it.

 3) The interrupt hardware interaction is reduced to the absolute minimum
    depending on the trigger type of the relevant interrupt controller.

Now #3 is the interesting one here and there are the following cases:

 A) Edge type

    Edge type interrupts are events which are triggered once when the
    level of the interrupt line changes. Depending on the implementation
    and configuration of the interrupt controller they react on either
    one direction of level change (low -> high, high ->low) or on both,

    They require that the interrupt is acked at the interrupt controller
    _before_ the handler runs. That's required because otherwise the
    device could issue a new interrupt after the initial one has been
    handled and before the ack was issued. That ack would then clear the
    new interrupt which would get lost and potentially starve the device
    forever.

    See handle_edge_irq()

    Edge type interrupts are also not suitable for interrupt sharing.

    Note, that MSI interrupts are edge type because the interrupt
    message is only sent once when the event happens.

 B) Level type

    Level type interrupts react on a static level state. If the
    interrupt line has the implementation/configuration defined level
    then the interrupt is delivered to the CPU up to the point where the
    interrupt line returns to the inactive level.

    For regular operation they usually require that the interrupt is
    masked before the handler runs and unmasked after the handler
    completes. This is required to prevent interrupt storms in case the
    handler reenables interrupts at the CPU level which is not relevant
    for Linux unless the interrupt handler is threaded. For threaded
    handlers the line must be masked until the thread completes.
    
    They are lossless because if the interrupt is reactivated after
    handling the initial one before the unmask of the line happens it is
    immediately delivered to the CPU again after the unmask takes place.

    Level interrupts can be shared lossless. (Note that interrupt
    sharing is a design fail from a performance perspective because the
    handling requires that all devices which share the same line need to
    be polled whether they actually issued an interrupt).

    Some level type controllers require an MASK/ACK sequence to work
    correctly. That's often the case when the controller supports both
    level and edge mode.

 C) EOI type

    EOI type interrupts are from their concept level interrupts.
    
    Contrary to regular level interrupts they do not require the mask
    and unmask operation to prevent an interrupt storm. The interrupt
    controller guarantees not to deliver the still active interrupt up
    to the point where the software issues EOI.

    The EOI happens after the actual device handler has run. That's a
    very efficient solution which avoids slow mask/unmask operations and
    at the same time guarantees that no interrupts are lost.

So lets look how this relates to strict per cpu interrupts,
i.e. interrupts which can only be delivered to one particular CPU.

As documented above the strict percpuness removes the requirement for
locking as the CPU itself guarantees non-reentrancy for the same
interrupt as long as interrupts are disabled at the CPU level while the
interrupt is serviced.

Aside of that this also affects the required operations for interrupt
handling. None of the true per cpu interrupts requires any form of
mask/unmask operation in the handler. They only require that the
relevant ACK/EOI operations take place. So for the 3 types above this
results in the following:

 A) Edge type

    Issue ACK before invoking the handler

 B) Level type

    If the controller does not require ACK, then no action is required.

    If the controller requires ACK, the ACK has to be issued before
    invoking the handler.

 C) EOI type

    Issue EOI after invoking the handler

As the MIPS GIC is a strict level type controller which does not require
ACK or EOI operations, the irq_ack/irq_eoi callbacks are completely
bogus.

There is also no need to change anything in the core code percpu handler
implementations.

All you need to do is to remove the bogus irq_ack/irq_eoi function
pointers from the MIPS GIC irq_chip and be done with it.

Thanks,

        tglx


    

  
