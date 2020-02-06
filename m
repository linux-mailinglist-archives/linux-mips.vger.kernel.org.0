Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C34BF153F12
	for <lists+linux-mips@lfdr.de>; Thu,  6 Feb 2020 08:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727500AbgBFHEz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Feb 2020 02:04:55 -0500
Received: from forward500p.mail.yandex.net ([77.88.28.110]:51342 "EHLO
        forward500p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727358AbgBFHEz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 02:04:55 -0500
Received: from mxback26o.mail.yandex.net (mxback26o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::77])
        by forward500p.mail.yandex.net (Yandex) with ESMTP id B040B940D26;
        Thu,  6 Feb 2020 10:04:51 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback26o.mail.yandex.net (mxback/Yandex) with ESMTP id csCvbGO9TV-4nMWtpu2;
        Thu, 06 Feb 2020 10:04:51 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1580972691;
        bh=4nPjw2SJ9FHKnglEe7z2mY1y5AkRLAt9Tl9x5mboVSk=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=qePsjYwANrQ8cUr/W21ldawSDjIDt/AXQp38EdKMiq6eGu2kMf2KYOfcsjg3Lnak/
         VNdQ1xZTzDWtWxCUipn8ukx78c7vbwMcdU/ifwMv8HQQzh0MRQV2X6FuOhq72mSfE/
         q9OqT2ZmBo456cMGUqH0sDF6cL0yIswQUTObYx+o=
Authentication-Results: mxback26o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva7-49db472ac642.qloud-c.yandex.net with HTTP;
        Thu, 06 Feb 2020 10:04:49 +0300
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Envelope-From: yjx@flygoat.com
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Huacai Chen <chenhc@lemote.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yinglu Yang <yangyinglu@loongson.cn>
In-Reply-To: <20200205101126.4fad0946@endymion>
References: <1579181165-2493-1-git-send-email-yangtiezhu@loongson.cn>
        <a267161f-c8b3-a11c-7416-3ab9ba19aa82@loongson.cn>
        <20200203131422.384cd168@endymion>
        <609c7042-0e44-2bd4-5e03-97465621b184@loongson.cn>
        <17537451580871338@vla4-87a00c2d2b1b.qloud-c.yandex.net> <20200205101126.4fad0946@endymion>
Subject: Re: [PATCH v2,RESEND] MIPS: Scan the DMI system information
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Thu, 06 Feb 2020 15:04:49 +0800
Message-Id: <2072641580972689@iva7-49db472ac642.qloud-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> On Wed, 05 Feb 2020 10:55:38 +0800, Jiaxun Yang wrote:
> 
>>> I think it is better to split it into the following two patches?
>>> [PATCH v3 1/2] firmware: dmi: Add macro SMBIOS_ENTRY_POINT_SCAN_START
>>> [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface (DMI)
>>
>> That way will break bisect.
> 
> Are you sure? As far as I can see, each patch builds individually. The
> dmi patch is a no-op alone. The mips patch will not work alone,
> obviously, however according to Tiezhu dmi_scan_machine() will fail
> with a harmless error message if the base address is 0xF0000. If that's
> correct then it's not breaking bisect.

Sorry, I even forgot that it's my modification :-)
Just don't want to trouble maintainers so much.

> 
> --
> Jean Delvare
> SUSE L3 Support
--
Jiaxun Yang
