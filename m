Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F62F8B2A8
	for <lists+linux-mips@lfdr.de>; Tue, 13 Aug 2019 10:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfHMIj7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Aug 2019 04:39:59 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41828 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfHMIj7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Aug 2019 04:39:59 -0400
Received: by mail-lj1-f196.google.com with SMTP id d24so100762508ljg.8
        for <linux-mips@vger.kernel.org>; Tue, 13 Aug 2019 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dEo3iCyZtJRe5rYXTeqmcKfXSAcXpTMTDiEVVWsO5nU=;
        b=AYO98FelDNakyWerSpC+pDGXhvDfhLG323EJ89mBpUWaMqQCA+MrPvn9o17H01W1+y
         OQlp2mL4nrwl4XPY3uaY1kAU5OVBxL4kThwhFdAcEM3IK4gfR10r6PhCPmcEKk/WBtMV
         Zuao/uj6m6ZAp/FA2zi0VR6pZFL6jdPKmMxmV4CUNpene9qy6C9sVY1dySdF5d/fZCbu
         mI6xx4u4nvbS+MOKskflscvaJ90+Kib5FEn03txGHvv0BU8E6QjL4d7idse1mQt/g8Iz
         pRHbjSG6cKHaC0prmacU3GbW9i6PBNt467swfynlXuDXZLr5FG0ZgwRNZXYR5NHUH/Qg
         uV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dEo3iCyZtJRe5rYXTeqmcKfXSAcXpTMTDiEVVWsO5nU=;
        b=Rh0SPU1XIIaln9lV9vCzLjsiF9YlB4Y+K5G3Dkp+T5KW7CZ7zMvyLwA69b5I2yiDbb
         dkoLnGTxCpaw6awUHhrvVilIkYRdavwFDM9m5hlhSmZ556raSL22IzGI02UtsgA99uQ8
         d32ep0zXQA6pXsu434lcdEY6U+oK7hEJPF0KNBPOBCbQ4ZYZl0eIYmnvKw4WU5uZ11rv
         8Gq8xlNd0qWhCLI1aVJgSg4ofQGnx4H6ApAqLSD8ya/xkDcouBpjX/Iyuomd6eerXKWR
         5kOtl7GSk6umBDB2vAyFdo151IOCITlJopvIzTwTYJ8MELSvM+C5wzXbJa6EloNn2LFs
         7dzQ==
X-Gm-Message-State: APjAAAUWVoWhLi97bPBJECiIugH64AO5SRqbFerKfni8ZKbjs5ACzeS/
        5NU60kjc1C8v367PAcOECmoUpqI/
X-Google-Smtp-Source: APXvYqwAWMD6NnndB5n2UJ63QBl3CSx2RIGrmX8hFQ3gwtKX20txNd9XF9ioJarSVz31IrLEFBovSQ==
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr9402642ljs.16.1565685597494;
        Tue, 13 Aug 2019 01:39:57 -0700 (PDT)
Received: from mobilestation ([95.79.14.48])
        by smtp.gmail.com with ESMTPSA id u15sm2372887ljk.93.2019.08.13.01.39.55
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 01:39:56 -0700 (PDT)
Date:   Tue, 13 Aug 2019 11:39:54 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "yasha.che3@gmail.com" <yasha.che3@gmail.com>,
        "aurelien@aurel32.net" <aurelien@aurel32.net>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "matt.redfearn@mips.com" <matt.redfearn@mips.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>
Subject: Re: [EXTERNAL]Drop boot_mem_map
Message-ID: <20190813083952.gg533rwix5ciclwc@mobilestation>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190812045618.ncqtfm6qmia6cxaz@pburton-laptop>
 <ac8efbfe-be18-ca91-2060-2a8c601cbbd1@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac8efbfe-be18-ca91-2060-2a8c601cbbd1@flygoat.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Jiaxun,

On Mon, Aug 12, 2019 at 01:28:19PM +0800, Jiaxun Yang wrote:
> 
> On 2019/8/12 下午12:56, Paul Burton wrote:
> > Hi Jiaxun,
> > 
> > On Thu, Aug 08, 2019 at 03:50:06PM +0800, Jiaxun Yang wrote:
> > > Hi there:
> > > I was trying to make a generic NUMA implementation for ip27 and loongson-3,
> > > and the boot_mem_map without nid support become a barrier of merging memory
> > > init code.
> > > 
> > > Rather than add nid support to boot_mem_map, this patchset drops the whole
> > > boot_mem_map as it can be replaced by memblock functions.
> > Very nice - cleaning this up will be a neat improvement :)
> > 
> > Am I right to suspect though that patch 1 will break the build for all
> > platforms that make use of boot_mem_map? (ie. all the platforms touched
> > by later patches in this series)
> 
> Yes. Rest of the set should fixed all the platforms.
> 
> You can verify by grep boot_mem_map tree-wide.
> 
> --
> 
> Jiaxun Yang
> 

The cleanup you did is great! I was going to do this myself when get to have
more free time. Thanks to you the only thing left is to review your work.

Regarding the Paul' comment about the platforms source code buildability in
patch 1. Alas it's a kernel patches requirement to leave the source code
buildable and the kernel runnable after each patch [1].

I am not sure about correct execution, but at least buildability can be reached
just by moving the patch 1 to the tail of the series.

Regarding the patches itself, I'll leave my comments inline within the
corresponding emails.

[1] https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L223
