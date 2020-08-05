Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559DE23C349
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 04:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgHECGm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Aug 2020 22:06:42 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:56510 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgHECGm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Aug 2020 22:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1596593201; x=1628129201;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-transfer-encoding;
  bh=mr8pEVR8EM2vtCoJYlVhaVMY23O+8KAaStBjD4hUG9U=;
  b=UOzwjeP3u11NEHuWvuztHqk1uf2wdN0hFd3uQBm7zqCRh1xTotCmTpOg
   imuUvnGEClv12uZEDCipCXg1Nflg7VQQsgyfcmOrdp1/vpLRE4PgQVu4m
   d2RMOwjzAr/rPilI4kfC2uQdYexp+E1Ymh/rgOkp3Pj8NY0JS2J/8ohSx
   buNH8Xzb9xn1vC+5jVGlXwhwkSOLHsWKawn/L2QsEE0uJYTOlkGPEyBps
   Tu4Ds8cc3JHlebp8Ygkj2Scbq9+i6SNoPpGNkzuHdxBXt/OZ98mPfNQ+K
   sVIFbNZI5UeDiUeqbd8JbU3mGq99srXFWcmPYtBhEzh4EzmwjGrsoIpQt
   w==;
IronPort-SDR: 4CiEYIfPGx/er/2fMh7GgBPYbry7z7bJ9UrdZbOpTf+Bg1vBQIt7Pg7ZrCumy8cJwVD8hIADXE
 V6khl8+rwHIEdz7sOI8Q86ldtpIacEEtP15Z+NgqL8b2tXTYAPb35C9pxggeqlh8N5pvauT0Zb
 OngvhgJGjfHP9vdT0xnqllilVb4WXsmwFXFICOs6892h3QBz/OvgYt3alSmEdAZmqc/QjjkE1x
 Cp8GMFlZFdu+Ji9eVfAegA6U6ayigL+qp2pG5m5485syJSBSJ4Bo9097FLKKGAPFplwaqCmkwZ
 /sw=
X-IronPort-AV: E=Sophos;i="5.75,436,1589212800"; 
   d="scan'208";a="253513162"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 05 Aug 2020 10:06:41 +0800
IronPort-SDR: dLsXiV1JFaRo4eYiVkK9KAv6/QaRoRbX8UHYUkmM1N4Yo5O3tX0CdUoRx65QsvAOpBoQZF9PQR
 hvHqMctAApUw==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 18:54:01 -0700
IronPort-SDR: TLhMEyPXwBjZRTNKUDbkN/wLMnj2ldUs7WjvT7jQGs0HtUMdjyM3RdD9bF/Ed/GwnQyNTpSQEe
 VPBQWkxZip7g==
WDCIronportException: Internal
Received: from unknown (HELO redsun52) ([10.149.66.28])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 19:06:40 -0700
Date:   Wed, 5 Aug 2020 03:06:36 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@wdc.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@linux-mips.org,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
In-Reply-To: <bcd3255c-bbb0-f4c0-1a33-7a16ee9f7b93@gmail.com>
Message-ID: <alpine.LFD.2.21.2008050259550.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200731042401.22871-1-f.fainelli@gmail.com> <21ad5472-1287-acba-5604-09f2e633c043@flygoat.com> <46de49ec-cc8b-708a-0cdd-82389b041078@gmail.com> <20200803113020.GA8958@alpha.franken.de> <bcd3255c-bbb0-f4c0-1a33-7a16ee9f7b93@gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 3 Aug 2020, Florian Fainelli wrote:

> >>>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> >>>> index 19308df5f577..df0efea12611 100644
> >>>> --- a/arch/mips/bmips/setup.c
> >>>> +++ b/arch/mips/bmips/setup.c
> >>>> @@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
> >>>>       bcm63xx_fixup_cpu1();
> >>>>   }
> >>>>   +static void bmips5000_pref30_quirk(void)
> >>>> +{
> >>>> +    __asm__ __volatile__(
> >>>> +    "    li    $8, 0x5a455048\n"
> >>>> +    "    .word    0x4088b00f\n"    /* mtc0 $8, $22, 15 */
> >>>> +    "    nop; nop; nop\n"
> >>>> +    "    .word    0x4008b008\n"    /* mfc0 $8, $22, 8 */
> >>>> +    /* disable "pref 30" on buggy CPUs */
> >>>> +    "    lui    $9, 0x0800\n"
> >>>> +    "    or    $8, $9\n"
> >>>> +    "    .word    0x4088b008\n"    /* mtc0 $8, $22, 8 */
> >>>> +    : : : "$8", "$9");
> >>>> +}
> >>> Hi,
> >>>
> >>> Is there any toolchain issue blocking read_c0_**** family helpers being
> >>> used?
> >>>
> >>> Use .word looks unreasonable.
> >>
> >> Yes, the assembler would be choking on the custom $22 selector, however
> > 
> > I guess you meant selector 8 and 15. If BMIPS has a 4 bit selector field
> > it might be good to do a binutils patch supporting it.
> 
> Yes, sorry that is what I meant. I don't think an assembler patch makes
> sense at this point given this is an isolated use, and there is not just
> binutils these days, the Clang/LLVM integrated assembler would also need
> to be supported, and then we would need to have the kernel say: I
> require this minimum version to support the customer selectors, not
> worth the trouble if you ask me.

 Well, I asked for a GAS patch to add support 4.5 years ago, so by now and 
9 binutils releases later it would have become fairly common.  And then I 
also suggested how to handle it in a robust way.  Cf. 
<https://www.linux-mips.org/cgi-bin/mesg.cgi?a=linux-mips&i=alpine.DEB.2.00.1602092245180.15885%40tp.orcam.me.uk>.

  Maciej
