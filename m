Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB79110D2D1
	for <lists+linux-mips@lfdr.de>; Fri, 29 Nov 2019 09:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfK2Iyt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Nov 2019 03:54:49 -0500
Received: from foss.arm.com ([217.140.110.172]:44820 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726586AbfK2Iys (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 29 Nov 2019 03:54:48 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742A730E;
        Fri, 29 Nov 2019 00:54:46 -0800 (PST)
Received: from [192.168.1.18] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27BA23F68E;
        Fri, 29 Nov 2019 00:54:45 -0800 (PST)
Subject: Re: MIPS: bug: gettimeofday syscall broken on CI20 board
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Maarten ter Huurne <maarten@treewalker.org>,
        mips-creator-ci20-dev@googlegroups.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
References: <18788C50-F29B-4BD7-89F6-B056FF490214@goldelico.com>
 <7b6275c7-ab2b-a647-6bf7-d5e1c4523c98@arm.com>
 <D1CE4D1E-9A42-4FAE-90A9-615C38B979C0@goldelico.com>
 <4807842.gtHLO0kk0V@hyperion>
 <01D75E67-EC2E-4C74-B9BB-752773C481A9@goldelico.com>
 <20191128150721.GA20142@alpha.franken.de>
 <4F75970F-81DA-4727-8ADC-17CF6D77829B@goldelico.com>
 <04b509b4-b1ef-3bcb-433e-8eed5772288f@arm.com>
 <BF04DB35-9DBA-4297-8FCA-BB422A56DFEC@goldelico.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <9ee8cbab-0655-f4d5-6699-fbe34fbe4d60@arm.com>
Date:   Fri, 29 Nov 2019 08:57:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <BF04DB35-9DBA-4297-8FCA-BB422A56DFEC@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/28/19 4:47 PM, H. Nikolaus Schaller wrote:
> Well, it does not immediately compile because CONFIG_MIPS_CLOCK_VSYSCALL is not
> set and can not be configured by normal means:
> 
> Error:
> 
> /Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c: In function '__cvdso_gettimeofday':
> /Volumes/CaseSensitive/master/lib/vdso/gettimeofday.c:152:4: error: implicit declaration of function 'gettimeofday_fallback' [-Werror=implicit-function-declaration]
>     return gettimeofday_fallback(tv, tz);

Oops, I just realized that I had other changes not committed that's why it does
not build for you directly. Sometimes I get so excited for fixing a problem that
I forget bits and peaces :) Sorry about that.

I am happy to hear that this sorts out the issue though. I will send out a new
series to test.

-- 
Regards,
Vincenzo
