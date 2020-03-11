Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB6F18100F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 06:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgCKFbb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 01:31:31 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42234 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgCKFbb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 01:31:31 -0400
Received: by mail-ot1-f65.google.com with SMTP id 66so687181otd.9;
        Tue, 10 Mar 2020 22:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mRaU0AqIThL9bVRbu+a3uE7ULIqF+zwOfxIVLuqdJ+E=;
        b=NtE3RCy7mnABRhFQlxK7AY6bPEJM4+yH1iCZhlEN6AmfDHifT0veCYRVYxUES13rYk
         LNMHvBu0rpvTqdPmZIPc2vPhfWyp1CdyjE6hLLjiT93fxCpf9ju6tv0c1/tdzWV7Xa8+
         K/Xf56eBn1Nz9l9yepM3HJi+eRl51tpuAJhBoBOYp0zbVUQhmsNn02+9u28PEMVkE+Mv
         wLDQnlX7k4zyzmjwD3yXLDdiVuaa5dd0WGsxzEv0ZWIduEc/CiOGGxxdLIOuxnZq+lqW
         2b8+afiBXLeWUuOIK4vqcKVoKNmKXy4CZFXImK+Tg/qnPtFquaKZnAFmbkE+6LPYit5u
         yloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mRaU0AqIThL9bVRbu+a3uE7ULIqF+zwOfxIVLuqdJ+E=;
        b=hyKh7Kfj4gbIeqqk1YzOsW+3BOIlGDJAwdEMzFz5RPlp0lYiU2y6hGNWSQbb+fSIod
         +ZHeupW/y7lFkGUQ9oof+opSdEkfVzvIcI/4GQn1kNkIjz5O1S1TAaVcVrr7dSongaKt
         TMTI4yleUHc1Fnyy3W9/6R3dTC6j2GxmBD634xdkEUkqkCiODY2hjeeqYFTfZjGAe7PC
         gnvIuf9vfIzp8C/lgM3kRGFpJAZv7p+rxfV0xSVZTIyRzhfSsa7Fr9HTOse3xThYPAUy
         Xvx9R3L4MWiLM0TrkpMuGVjgPy0CrnftqgysI5F4KawyMYu3wntSIEqcZFMPsrOMCh/8
         utfQ==
X-Gm-Message-State: ANhLgQ3LhzhUNEprI0ZDuJsLfxDwdHXgff4ZuXATiXRp7YysrbdsR0Of
        1u17SJDuGHzMSqm3k3cZ3cw=
X-Google-Smtp-Source: ADFU+vvs2EpekK1XhQaOxK2H/diS+7ZScfO4M0urCZbqCYmSLIA7g/iGRL/1x2OE+pmtzyFhOSV3Ng==
X-Received: by 2002:a9d:3b6:: with SMTP id f51mr1050716otf.255.1583904688182;
        Tue, 10 Mar 2020 22:31:28 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id m124sm776958oib.46.2020.03.10.22.31.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 22:31:27 -0700 (PDT)
Date:   Tue, 10 Mar 2020 22:31:26 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
Message-ID: <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 05, 2020 at 05:27:53PM +0530, afzal mohammed wrote:
> request_irq() is preferred over setup_irq(). Invocations of setup_irq()
> occur after memory allocators are ready.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> remove_irq() has been replaced by free_irq() as well.
> 
> There were build error's during previous version, couple of which was
> reported by kbuild test robot <lkp@intel.com> of which one was reported
> by Thomas Bogendoerfer <tsbogend@alpha.franken.de> as well. There were a
> few more issues including build errors, those also have been fixed.
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>

This patch regresses booting malta_defconfig with both GCC and clang
with this rootfs and QEMU 4.2.0:

https://github.com/ClangBuiltLinux/continuous-integration/blob/a85e3e44c2570847e22ad8f92f317c2b007c4517/images/mipsel/rootfs.cpio

$ timeout 2m qemu-system-mipsel -machine malta -cpu 24Kf -initrd rootfs.cpio -kernel vmlinux -m 512m -display none -serial mon:stdio

just hangs. I have not done further debugging past the initial bisect.

Cheers,
Nathan
