Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28038181274
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 08:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgCKH4c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 03:56:32 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44072 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbgCKH4c (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 03:56:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id 37so724575pgm.11;
        Wed, 11 Mar 2020 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hKRLUEOkt4uqRQRU+kMzzPavE35BURSZlwqA28UO4lM=;
        b=hIAiHixSgSB8CG6jFRazUx7eGmIVELTjcRzoaclR4wisH+6SF02A+mqUStcmGTI//M
         ndmIAOXWtDjRUhWawWx9q9jdRdlyHTK01mSj5VCDaq3jtVPrKl+5GZU8GR0WDxsJNTVI
         KIRuPbPOIq6HdU1pZdj64n5zHlxC/AJQWTHAGwVKTuE1+jtM1zzzv6u5JRUSvubNgnOO
         JaQq6F68Vp8t2AsRBMQpIf4gfk6fdJ+ISRcEdcrvRfqjnZdLMWj0PujOWQOOgu8vCZEq
         3HdcqqwBIk2ZWOZDlEc3O3GJBcphdaRPbe4UxAtk6JsHXf54RS0UYhcNo36XBOz7CHvf
         xYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hKRLUEOkt4uqRQRU+kMzzPavE35BURSZlwqA28UO4lM=;
        b=BjpWuCzad5Loko7rrbjmL5FNGWP1KEmG1LwuY/diEKWoZ4qG0dS7U3wzGr8mCzyrjB
         oMLthuo7MeDcO57S5fI4F7/agZ+mVROvUH5mcEEo9LcVQdebhi5FZ4i58ZHslOykBhVi
         6Xqw/gedXbeLKeTE9feFt6RNz3GaKDJmqveJm0g49QUKTfM3e1j1yMEgwhC4IEbzXAMP
         5CQ4CdCpgrBwJLRaVZbolVGucRFbpp/vFzDbvfqnJeU7kojsCvhU+RE05pGExiWpA6MT
         6FEfoU1PXLdxyXV2tSQfDBhX0UHLd/uQ51ZjkFjoqh+eVd0KwT2jYugZydnVzgWPwann
         89wQ==
X-Gm-Message-State: ANhLgQ0oX/lsQTpg4E5VSn41iKydzO9faPybRVLJPASopSA6vSr0jxnY
        fQiHY3SAId2O7jGtJ2PXW78=
X-Google-Smtp-Source: ADFU+vsj5VHBIH60lW4mWAjTEbLfKzxmDR2I9/6w7rOrbhTOb6WgKGPMCYdlyg7RtNUnAx7/rd5wlA==
X-Received: by 2002:a63:6203:: with SMTP id w3mr1710913pgb.35.1583913390950;
        Wed, 11 Mar 2020 00:56:30 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id y7sm10093247pfq.159.2020.03.11.00.56.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 00:56:30 -0700 (PDT)
Date:   Wed, 11 Mar 2020 13:26:28 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
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
Message-ID: <20200311075628.GA6313@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Nathan,

On Tue, Mar 10, 2020 at 10:31:26PM -0700, Nathan Chancellor wrote:

> This patch regresses booting malta_defconfig with both GCC and clang
> with this rootfs and QEMU 4.2.0:
> 
> https://github.com/ClangBuiltLinux/continuous-integration/blob/a85e3e44c2570847e22ad8f92f317c2b007c4517/images/mipsel/rootfs.cpio
> 
> $ timeout 2m qemu-system-mipsel -machine malta -cpu 24Kf -initrd rootfs.cpio -kernel vmlinux -m 512m -display none -serial mon:stdio
> 
> just hangs. I have not done further debugging past the initial bisect.

i will look into it.

Regards
afzal
