Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E52B219C55F
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2020 17:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389109AbgDBPDf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Apr 2020 11:03:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:54858 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389102AbgDBPDf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Apr 2020 11:03:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585839814; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=MFdcBokfw79s+7lRCHgLw9NzMSmYZr6xzGhOl6ZSO68=; b=liUyNNQsvAGxySif54oTFwi6cbi1wZSPQ/GJBXWYhDwcL7G6AiZ0LVZIGS7uSW8bDOgkjUr7
 A05wn6RwUGwuI/utuIYOc/vdcojE+YBiwTBHoTaRZjDV4LsvKnGcYo6jdk0YXbUz/lnuGNps
 0Hdxh/vlefwsY+zYH3Y2EEM8pUY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkNGZkNiIsICJsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e85fec5.7f860c730110-smtp-out-n01;
 Thu, 02 Apr 2020 15:03:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5C71DC433F2; Thu,  2 Apr 2020 15:03:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        SUSPICIOUS_RECIPS autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net [104.54.226.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bcain)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 866DFC43636;
        Thu,  2 Apr 2020 15:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 866DFC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bcain@codeaurora.org
Reply-To: <bcain@codeaurora.org>
From:   "Brian Cain" <bcain@codeaurora.org>
To:     "'afzal mohammed'" <afzal.mohd.ma@gmail.com>
Cc:     "'Thomas Gleixner'" <tglx@linutronix.de>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <x86@kernel.org>,
        <linux-sh@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-parisc@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
        <linux-ia64@vger.kernel.org>, <linux-hexagon@vger.kernel.org>,
        <linux-c6x-dev@linux-c6x.org>, <linux-omap@vger.kernel.org>,
        <linux-alpha@vger.kernel.org>
References: <20200321174303.GA7930@afzalpc> <cover.1585320721.git.afzal.mohd.ma@gmail.com> <059b01d604ab$637355b0$2a5a0110$@codeaurora.org> <20200328073253.GA5250@afzalpc>
In-Reply-To: <20200328073253.GA5250@afzalpc>
Subject: RE: [PATCH 0/6] Kill setup_irq()
Date:   Thu, 2 Apr 2020 10:03:28 -0500
Message-ID: <0fc601d608ff$df0ea550$9d2beff0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQH+2owB65JuA03jeOLwO39OK5TmSwJQWNztApEZe3IB1U/c2KfelGEA
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> -----Original Message-----
> From: linux-hexagon-owner@vger.kernel.org <linux-hexagon-
> owner@vger.kernel.org> On Behalf Of afzal mohammed
...
> On Fri, Mar 27, 2020 at 09:48:38PM -0500, Brian Cain wrote:
> 
> > > Note 2: hexagon final image creation fails even w/o my patch
> 
> > 	What's the nature of the failure in "Note 2"?
> 
> drivers/base/firmware_loader/main.o: In function `fw_is_builtin_firmware':
> /devel/src/kernel6/drivers/base/firmware_loader/main.c:132:(.text+0xc8):
> relocation truncated to fit: R_HEX_16_X against symbol
`__start_builtin_fw'
> defined in .modinfo section in .tmp_vmlinux1
> Makefile:1077: recipe for target 'vmlinux' failed
> make: *** [vmlinux] Error 1

Thanks for reporting it -- I will make a patch to fix it.

-Brian
