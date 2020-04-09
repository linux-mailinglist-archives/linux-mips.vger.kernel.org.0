Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1A21A31F3
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 11:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgDIJk7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 05:40:59 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17827 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726623AbgDIJk7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Apr 2020 05:40:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586425119; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=Xm3Is2wmldS7Fqn/L5Q9W0eSTd20L/QVaCDc+Vfft1gdW9dt2kAAM0cIAf9QqwZYe8gMrCxaAmMGZMQ1HMXv8nn09ncigMrsB35uIxZx8cKqBtt5nYMjyYbr0ze1VofG7oJ1Spoc777iaizchzhflfRo27m2GzynOdL3uVDXdTM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586425119; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=U3OUEi6suDWXBHYtmbz9aBjh2aLvWTneUmFTniJfo9s=; 
        b=GnkLlFKnSKLj7DTVZTCdrjRlP13qvpGHkadT06XRSrxPEvlumpO+GPjc4eFAZNA/+11z+vefJoRIa8E0aQNKXGHzBlmH09EHBsTXKKACzHrgeWMIg4XqMX+WIOwauAR0mVVTTWOHMuhDnGg9h+EuxU9vOwviXM9vr+zuu+DJ/YI=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586425119;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=U3OUEi6suDWXBHYtmbz9aBjh2aLvWTneUmFTniJfo9s=;
        b=WqgMCsmN0p2/AV8ZdfiD+DjoAfTXs8dItcVu2zIm6F/K0Y2L8txyGC+aMAhLvVJo
        BJmAcvz5IYBaC1PS2faE4yaDdTxyVP9q6rmPEzDOI5h2xnckGO1KYfiyVAo3FP/hr2T
        qfo7neCcoswAdkrD/N6mKWV5xwB5PSobKn1Lek4c=
Received: from flygoat-x1e (122.235.212.87 [122.235.212.87]) by mx.zoho.com.cn
        with SMTPS id 1586425116678346.8969598464105; Thu, 9 Apr 2020 17:38:36 +0800 (CST)
Date:   Thu, 9 Apr 2020 17:38:35 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Subject: Re: [PATCH 12/12] MIPS: ip27: Fix includes
Message-ID: <20200409173835.27ed1e64@flygoat-x1e>
In-Reply-To: <20200409091922.GA17293@linux.ibm.com>
References: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
        <20200408130024.2529220-7-jiaxun.yang@flygoat.com>
        <20200409091922.GA17293@linux.ibm.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 9 Apr 2020 12:19:22 +0300
Mike Rapoport <rppt@linux.ibm.com> wrote:

> On Wed, Apr 08, 2020 at 08:59:54PM +0800, Jiaxun Yang wrote:
> > Somehow changes in topology messed up headers.
> > So just add necessary headers to make it compile again.  
> 
> Please avoid aftermath build fixes because it breaks bisection.
> Each commit should be buildable, so this changes should go into the
> patches that actually require them.

I'd love to but for that I'll have to squash patch #5~#12 into a single
patch. T thought it's to big and touching too many files.

Is that acceptable? 

Thanks.
>  
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
--
Jiaxun Yang


