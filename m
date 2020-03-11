Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE530181DEC
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 17:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730052AbgCKQcx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 12:32:53 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40409 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729852AbgCKQcx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 12:32:53 -0400
Received: by mail-pj1-f67.google.com with SMTP id gv19so1283476pjb.5;
        Wed, 11 Mar 2020 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zmUBvFmNMYqAgE4hUh5PxorZyEbBCYGzea7UV2DPByM=;
        b=okn3wxoxdRHK59h+9WIq7oUfCZKvj8jYSlljDW2vEtjcLJX7mgYZASlfNT2PSYE6Ew
         hTxbbboBZjfEQPOaLaDTKkp2kAaVqZVROy0sVYOndeFLtoC7w9dk7d90z8EtJQq0Vx0R
         vy9cgKIwOxAWv5BdqTYwtuiYYyguWrlCbqRIYcLTabjY59Uz+WnOAb8XXE+r/5G2b4FS
         0hKP4XWaegGUW05mM/tuyOjn8lu6DjLqOKDzuzDjE1W3KtsqetyMjI5B1hTR1nJumbKu
         vF4IfBaBzIIt5RZA++Mg8wN3WcVTwUS5m/euqks2Ta8zJGfFhw2KCVKjQnHaLV+MY2Wg
         tbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zmUBvFmNMYqAgE4hUh5PxorZyEbBCYGzea7UV2DPByM=;
        b=M2rJnaR+2K0b0xNvw2qg5sMWEgCUFV4UCXZ8hobAzrGHHQOaQ2grG7zapKyvKEmSrL
         Y4v3UvtNubOz1sbXM3xfGmYmD1f8+hXo31TQxzhuCK7AH+4nHmQerGgCZBzlZi3mxnIK
         THm6TTztIXKvFUuzAyoiUAF7dqplG9NPaU8gQxrTLc3nPU0xqtYlnGMkqF9EP1GwTBKV
         bMw1kLZhtEOC7UncLgHZWmA9p8fe18T8ato76Y/gPva91gei4lZSawLk+RjNXVqTB1wn
         uI5/xL+yJhazasWX+/WN8lqEHBhGAccthdM+GLk2rzq3XG4v3H/4fauKf5QpxDkFs2T1
         MumA==
X-Gm-Message-State: ANhLgQ2exVk2bdb2LEHaWKGGz+sAf8ONpUiaIfulgCKP6WuIBlA9EjZy
        pyd6AeXon2a8IokAbvl/iOY=
X-Google-Smtp-Source: ADFU+vtseRHn4vAz5dlT4WliTsDFscNXLHw6uylAKsWiiB6pM6JEaG1187JNfqDIKnTVPdUgOiyByg==
X-Received: by 2002:a17:90a:4487:: with SMTP id t7mr4170485pjg.104.1583944371770;
        Wed, 11 Mar 2020 09:32:51 -0700 (PDT)
Received: from localhost ([106.51.232.35])
        by smtp.gmail.com with ESMTPSA id q12sm51720409pfh.158.2020.03.11.09.32.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 09:32:50 -0700 (PDT)
Date:   Wed, 11 Mar 2020 22:02:49 +0530
From:   afzal mohammed <afzal.mohd.ma@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
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
Message-ID: <20200311163249.GA4984@afzalpc>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200311053126.GA48442@ubuntu-m2-xlarge-x86>
 <20200311090308.GA5060@afzalpc>
 <20200311104217.GA10615@alpha.franken.de>
 <20200311131210.GA5115@afzalpc>
 <20200311160307.GA15464@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311160307.GA15464@alpha.franken.de>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Wed, Mar 11, 2020 at 05:03:07PM +0100, Thomas Bogendoerfer wrote:
> On Wed, Mar 11, 2020 at 06:42:10PM +0530, afzal mohammed wrote:

> > If IRQF_SHARED is passed, it exepcts a non-NULL dev_id, here it is
> > NULL, setup_irq() doesn't have any check like that.
> 
> so request_irq() is not a 1:1 replacement for our current setup_irq().
> Or put it the another way our setup_irq() might be buggy, when used for
> shared interrupts.

AFAIU, this causes problems only while freeing irq, but not sure. Seems
it is not happening with any of the cases in the diff.

> > So i think proper solution is to add a non NULL dev_id, as removing
> > IRQF_SHARED might affect some platforms that might be using that
> > interrupt line shared.
> > 
> > Patch with non-NULL dev_id below, it works w/ Nathan's test case.
> 
> I'm not sure, I like the adding of string pointers as dev_id arguments
> in your patch. How can we make sure they are unique enough for the use
> case ? I guess using handler as dev_id does a better job here.

There was one prior similar usage using string pointers, another way i
have seen is using irq no. itself, but then it has to be typecasted,
in file arch/mips/txx9/generic/pci.c,

        request_irq(irq, &i8259_interrupt, IRQF_SHARED,
                "cascade(i8259)", (void *)(long)irq);

[ but i think that double casting is not required, only (void *) might
suffice ]

If you prefer handler function pointer, i will use that.

> And before doing that, lets clean up some of the IRQF_SHARED usage first.
> All sni IRQF_SHARED can go away, the interrupt lines are exclusive there. 
> 
> loongson2ef/lemote-2f/irq.c: looks like the only user of
> LOONGSON_NORTH_BRIDGE_IRQ, so IRQF_SHARED could go as well.
> Could someone confirm that ?
> 
> All other need to stay, IMHO.

Okay, i am venturing into MIPS the first time as part of this patch
series, so no MIPS specific knowledge, just let me know
loongson2ef/lemote-2f case as well, i will prepare patch accordingly. 

> And v4 is already in mips-next, so I need an incremental patch please.

Okay, i already sent a patch, it crossed your mail, i will make a new
patch based on the outcome of the discusson here.

Since there is some issue w/ lore.kernel.org, i send it again, but
both are not seen in archives.

Regards
afzal
