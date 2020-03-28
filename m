Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE8819632F
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 03:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgC1Cs5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Mar 2020 22:48:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:11074 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727070AbgC1Cs5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Mar 2020 22:48:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585363736; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Reply-To: Sender;
 bh=+WpPnB0uFYRHxbJdTSXbZ3CsA3rPO9kHVEIdO35S7As=; b=vwPJhjm0j/vLl3nHGUqvZITFLtkH8Y6wN+XfVyJCpJUEr2CS8X4TVmKOteAk6PhRCCbhef83
 fCy6ic9rbBoHo/G1pSfBX9pF/WyyLk4XyTliJKnapmyqpUmCn4OZNHY9sOOhvd6AIcZMYEr0
 Ywc46HyYYNbrB7yMh3m9fd4oPnk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkNGZkNiIsICJsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7ebb0a.7f57878b4260-smtp-out-n02;
 Sat, 28 Mar 2020 02:48:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E01CC4478C; Sat, 28 Mar 2020 02:48:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        SUSPICIOUS_RECIPS autolearn=no autolearn_force=no version=3.4.0
Received: from BCAIN (104-54-226-75.lightspeed.austtx.sbcglobal.net [104.54.226.75])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bcain)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7892C433F2;
        Sat, 28 Mar 2020 02:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7892C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bcain@codeaurora.org
Reply-To: <bcain@codeaurora.org>
From:   "Brian Cain" <bcain@codeaurora.org>
To:     "'afzal mohammed'" <afzal.mohd.ma@gmail.com>,
        "'Thomas Gleixner'" <tglx@linutronix.de>
Cc:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <x86@kernel.org>,
        <linux-sh@vger.kernel.org>, <linux-s390@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-parisc@vger.kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
        <linux-ia64@vger.kernel.org>, <linux-hexagon@vger.kernel.org>,
        <linux-c6x-dev@linux-c6x.org>, <linux-omap@vger.kernel.org>,
        <linux-alpha@vger.kernel.org>
References: <20200321174303.GA7930@afzalpc> <cover.1585320721.git.afzal.mohd.ma@gmail.com>
In-Reply-To: <cover.1585320721.git.afzal.mohd.ma@gmail.com>
Subject: RE: [PATCH 0/6] Kill setup_irq()
Date:   Fri, 27 Mar 2020 21:48:38 -0500
Message-ID: <059b01d604ab$637355b0$2a5a0110$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQH+2owB65JuA03jeOLwO39OK5TmSwJQWNztp/kerbA=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> -----Original Message-----
> From: linux-hexagon-owner@vger.kernel.org <linux-hexagon-
> owner@vger.kernel.org> On Behalf Of afzal mohammed
> Sent: Friday, March 27, 2020 11:08 AM
> To: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-soc@vger.kernel.org; x86@kernel.org; linux-
> sh@vger.kernel.org; linux-s390@vger.kernel.org; linuxppc-
> dev@lists.ozlabs.org; linux-parisc@vger.kernel.org; linux-
> mips@vger.kernel.org; linux-m68k@lists.linux-m68k.org; linux-
> ia64@vger.kernel.org; linux-hexagon@vger.kernel.org; linux-c6x-dev@linux-
> c6x.org; linux-omap@vger.kernel.org; linux-alpha@vger.kernel.org
> Subject: [PATCH 0/6] Kill setup_irq()
...
> Note 1: sh toolchain is available, but that will not make the  relevant
changes
> compile as it has dependency of 64bit arch toolchain,  did try a Kconfig
hack
> to make it compile w/ 32bit sh toolchain, but it  failed due to other
reasons
> (unknown operands), so gave up on that.
> Note 2: hexagon final image creation fails even w/o my patch, but it  has
> been ensured that w/ my changes relevant object files are getting  built
w/o
> warnings.

Afzal,

	What's the nature of the failure in "Note 2"?

-Brian
