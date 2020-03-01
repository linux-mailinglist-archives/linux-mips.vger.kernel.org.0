Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5228A175113
	for <lists+linux-mips@lfdr.de>; Mon,  2 Mar 2020 00:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgCAXuZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Mar 2020 18:50:25 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:33354 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgCAXuZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 1 Mar 2020 18:50:25 -0500
Received: from [192.168.1.13] (c-73-173-172-109.hsd1.va.comcast.net [73.173.172.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 0C8E334F1B0;
        Sun,  1 Mar 2020 23:50:23 +0000 (UTC)
Subject: Re: MIPS Hardware support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20200227144910.GA25011@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <7cbd08b1-2841-7ffc-eab8-410a77eae083@gentoo.org>
Date:   Sun, 1 Mar 2020 18:50:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200227144910.GA25011@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/27/2020 09:49, Thomas Bogendoerfer wrote:
> Hi,
> 
> we have 47 MIPS system types and I'd like to get an overview how alive
> they really are. I've already grouped the 47 systems a little bit by
> hardware I already own and regulary test kernels. Could you please
> give me some feedback about the "unclassified" systems ? What systems
> are supported by qemu (real test not just repeating qemu docs) ?
> Thank you for your help.

Almost all SGI-based machines here:
  - SGI IP19/Indigo R4000 (speed unknown)
  - SGI IP22/Indy R5000 (dead RTC at the moment)
  - SGI IP26/Indigo2 R8000
  - SGI IP27/Onyx2 R14000 x4 @ 500MHz
  - SGI IP27/Origin 200 R12000 x2 @ 360MHz
  - SGI IP28/Indigo2 R10000
  - SGI IP30/Octane R14000 x2 @ 600MHz
  - SGI IP30/Octane R12000 x2 @ 400MHz
  - SGI IP32/O2 RM7000 @ 350MHz
  - SGI IP32/O2 R10000 @ 250MHz (I think)
  - SGI IP35/Fuel R14000 (I think)
  - SGI IP35/Origin 300 R14000 x4 @ 500MHz
  - SGI IP35/Tezro R16000 x4 @ 700MHz

Also have a Cobalt RaQ2 that might be salvageable, and I recently picked up
a Cobalt Qube2 that probably works (but I haven't powered it up yet).
Doubtful either of those can handle modern Linux, since their RAM is capped
at 256MB, and current gcc probably needs a lot more than that to even build.

I've enough spare parts that I can probably cobble together an RM5200-based
O2, the same CPU class as in the Cobalt devices (CPU_NEVADA), should testing
on that kind of CPU be needed (PMC Sierra-based, not NEC, so there are
differences).

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
