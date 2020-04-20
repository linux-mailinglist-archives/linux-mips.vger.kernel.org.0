Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D3B1B130E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 19:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgDTRbU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 13:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726067AbgDTRbT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 13:31:19 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED8BC061A0F;
        Mon, 20 Apr 2020 10:31:19 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jQaGL-0003DP-4G; Mon, 20 Apr 2020 19:31:17 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 81C6F101623; Mon, 20 Apr 2020 19:31:16 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/3] Remove setup_percpu_irq() & remove_percpu_irq
In-Reply-To: <20200419144638.ysghqzklebkeer4z@afzalpc>
References: <cover.1586434781.git.afzal.mohd.ma@gmail.com> <20200419144638.ysghqzklebkeer4z@afzalpc>
Date:   Mon, 20 Apr 2020 19:31:16 +0200
Message-ID: <87pnc2awt7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Afzal,

afzal mohammed <afzal.mohd.ma@gmail.com> writes:
> On Sat, Apr 11, 2020 at 09:34:07PM +0530, afzal mohammed wrote:
>
>> While doing the removal of setup_irq(), it was observed that
>> setup_percpu_irq() also can be removed similarly by replacing it w/
>> request_percpu_irq(), which does allocate memory. In the initial
>> setup_irq() removal cover letters [1], it was mentioned that
>> setup_percpu_irq() is untouched.
>> 
>> After removing setup_irq(), it does not look good to let live
>> setup_percpu_irq(), especially since it being a low hanging fruit. Hence
>> replace setup_percpu_irq() by it's allocator equivalent.
>> request_percpu_irq() cannot be used since all the users need to pass
>> IRQF_TIMER flag, which it would not allow. Thus it's variant,
>> __request_percpu_irq() is used.
>> 
>> In addition to removing setup_percpu_irq() definition,
>> remove_percpu_irq(), unused, is also removed.
>
> Do you feel that this series adds value ?, if not, i will abandon this
> series.

 7 files changed, 10 insertions(+), 75 deletions(-)

is definitely worth it. There is no point in having two interfaces. I'll
have a look at the changes later today.

Thanks,

        tglx
