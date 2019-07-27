Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF7B777AD
	for <lists+linux-mips@lfdr.de>; Sat, 27 Jul 2019 10:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfG0Igc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jul 2019 04:36:32 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:34782 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727624AbfG0Igc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Jul 2019 04:36:32 -0400
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 52164348CE4;
        Sat, 27 Jul 2019 08:36:31 +0000 (UTC)
Subject: Re: [PATCH 4/4] MIPS: Remove unused R8000 CPU support
To:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc:     Paul Burton <pburton@wavecomp.com>
References: <20190722215705.20109-1-paul.burton@mips.com>
 <20190722215705.20109-4-paul.burton@mips.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <56180022-f5dc-d35d-8411-87f96412883d@gentoo.org>
Date:   Sat, 27 Jul 2019 04:36:28 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190722215705.20109-4-paul.burton@mips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/22/2019 18:00, Paul Burton wrote:
> Our R8000 CPU support can only be included if a system selects
> CONFIG_SYS_HAS_CPU_R8000. No system does, making all R8000-related CPU
> support dead code. Remove it.
> 
> Signed-off-by: Paul Burton <paul.burton@mips.com>

[snip]

I actually have one of these CPUs, and the SGI IP26 system to go with it.
Fascinating CPU design.  More like a multi-chip set rather than just a
single CPU die.  That said, no tears are shed over this code getting
excised, as it's half-complete, because only the R8K TLB code was written.
The cache code (c-r8k.c?) was never completed.  I don't even know if the R8K
TLB code was ever tested on real hardware.  A scanned copy of the CPU manual
is on the linux-mips FTP server somewhere, and I think I have a copy
somewhere as well, if anyone ever gets interested again.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
