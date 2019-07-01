Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF75C307
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 20:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfGASbe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 14:31:34 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:51090 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfGASbe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Jul 2019 14:31:34 -0400
Received: from [192.168.1.13] (c-73-132-78-152.hsd1.md.comcast.net [73.132.78.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 2CB5F34684A;
        Mon,  1 Jul 2019 18:31:33 +0000 (UTC)
Subject: Re: SGI-IP30
To:     Carlo Pisani <carlojpisani@gmail.com>,
        Matt Turner <mattst88@gmail.com>
Cc:     Paul Burton <paul.burton@mips.com>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        =?UTF-8?Q?Ren=c3=a9_Rebe?= <rene@exactcode.com>
References: <b201c33a-5beb-3dfb-b99b-d9b8fc6c2c64@hauke-m.de>
 <CA+QBN9A3JmvfCZkXZ2-Yd=nkQCQD48OgYEpe+Po4MuZFpmnPrQ@mail.gmail.com>
 <20190624175553.2tpepq5zsamovrra@pburton-laptop>
 <060345a6-bef2-ec17-e264-eccda29f5c8b@gentoo.org>
 <CAEdQ38F6gG1Ee5h6PXZ-wuxuOxAycaWBD_+hTNRjtfQHNw696g@mail.gmail.com>
 <CA+QBN9DO9sAadwFU6kpAfBxZuTVEx8_9DUYFBs6fTA6==cVDwQ@mail.gmail.com>
 <CA+QBN9B33Crhyahn5SXZJY8Pk7tDnhqgReuJKx5FhgguG=GXWg@mail.gmail.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <f633861c-900f-02c5-e592-2ea1c3f1f8f2@gentoo.org>
Date:   Mon, 1 Jul 2019 14:31:30 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+QBN9B33Crhyahn5SXZJY8Pk7tDnhqgReuJKx5FhgguG=GXWg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/28/2019 04:27, Carlo Pisani wrote:
> guys
> I have just tested the shoehorn in SlotC: there are quirks, but at
> least the kernel doesn't panic
> 
> to summarize:
> ShoeHorn in XIO-SlotA: panics
> ShoeHorn in XIO-SlotB: not yet tested
> ShoeHorn in XIO-SlotC: doesn't panic
> ShoeHorn in XIO-SlotD: panics
> 
> - UP -
> A | B
> D | C
> 
> ShoeBox: doesn't panic

XIO Slot A and D are typically where the graphics boards go for Impact
(depending on the Impact board).  Slot B might give issues as well because
Odyssey, which is two XIO slots wide, usually occupies A & B (though it only
ever plugs into a single XIO connector).  The Panics are probably due to
some hardcoded logic in Stan's original patches I mentioned that always
assume the presence of a graphics board, because Octane was primarily a
graphics workstation.

Is the shoehorn adapter you have the very rare Octane model, or an Origin
version modified with an Octane XIO locking latch?

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
