Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F281AD31F
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 01:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgDPXTB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 19:19:01 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:36686 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgDPXTB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 19:19:01 -0400
Received: from [192.168.1.13] (c-73-173-172-109.hsd1.va.comcast.net [73.173.172.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 0B4D334F151;
        Thu, 16 Apr 2020 23:18:58 +0000 (UTC)
Subject: Re: [PATCH] Add missing ifdefs to SGI Platform files for IP22, IP32
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
References: <87be6e36-04de-684b-0361-91de9ce2c731@gentoo.org>
 <20200416163051.GA24457@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <f4c06481-7fa3-d84c-5aa9-f991daef058c@gentoo.org>
Date:   Thu, 16 Apr 2020 19:18:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200416163051.GA24457@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/16/2020 12:30, Thomas Bogendoerfer wrote:
> On Mon, Mar 30, 2020 at 11:25:52PM -0400, Joshua Kinard wrote:
>> The attached patch fixes the SGI-specific Platform files to only be
>> included when their specific platform is actually built.  Both the
>> IP27 and IP30 Platform files already have such ifdefs in place.  This
>> patch adds the same to the IP22 and IP32 Platform files.
> 
> looking at all other Platform files, I fail to see why this is needed.
> It looks like removing the ifdefs from IP27 and IP30 is the way to
> go. What do I miss here ?
> 
> Thomas.

I ran into an issue long ago where an IP32 kernel tried dragging in some of
the directives in IP30 because of the missing ifdef checks, thus causing the
build to fail.  I developed that patch back then after looking at IP27's
Platform file and assuming it was added to prevent a similar problem between
IP22 and IP27.  I never figured out why it happened (some glob somewhere
doing "ip3*" in IP32's code?), and haven't tried testing for it since making
that patch.  Just one of the simpler patches in my patch set that I thought
I'd send in.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
