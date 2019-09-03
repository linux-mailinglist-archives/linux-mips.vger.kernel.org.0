Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346A3A5FF8
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 06:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725818AbfICEBi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Sep 2019 00:01:38 -0400
Received: from forward102o.mail.yandex.net ([37.140.190.182]:60994 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725440AbfICEBi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 3 Sep 2019 00:01:38 -0400
Received: from mxback2o.mail.yandex.net (mxback2o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1c])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id 2C1546681280;
        Tue,  3 Sep 2019 07:01:36 +0300 (MSK)
Received: from smtp3o.mail.yandex.net (smtp3o.mail.yandex.net [2a02:6b8:0:1a2d::27])
        by mxback2o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id NKX2XENC4k-1ZPm2Z7Q;
        Tue, 03 Sep 2019 07:01:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567483296;
        bh=k3jrsliRqjunWJ4fFKsDRMRfOV9W5xfLnUoCuRIstaM=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=kJZN8mloCKGuRbgEB++R85paRHt2WB6iQg6gTHRaUP4xazYXZX2KGj4+6dPHmX3iy
         10hGaDJfb51B9H6tCK36f1QQQ+HplMEQzaihrLUPmM3jFhYr9aMqaIu1yHiPVU7WI0
         7nX/OUyNWrJCMNZa7JE6AcUS+j3xrfZSQsYTKxQM=
Authentication-Results: mxback2o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp3o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id qnvmsJrDlQ-1XMaGF9g;
        Tue, 03 Sep 2019 07:01:34 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 094/120] MIPS: PS2: FB: Frame buffer driver for the
 PlayStation 2
To:     Fredrik Noring <noring@nocrew.org>
Cc:     linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <4927c42fb3401c42c4c5a077f272331ac79d80b1.1567326213.git.noring@nocrew.org>
 <1003c9cc-c30e-00a7-7494-4f1cb4862e88@flygoat.com>
 <20190902144007.GA2479@sx9>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2ac424e5-017b-5892-ef38-fe25ec5f38d1@flygoat.com>
Date:   Tue, 3 Sep 2019 12:01:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190902144007.GA2479@sx9>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2019/9/2 22:40, Fredrik Noring 写道:
> Hi Jiaxun Yang,
>
>> According to kernel policy[1] no more new FBDev driver would be accepted.
>>
>> Please refactor it to DRM.
> I had the impression that the DRM does not support a kernel console?

Hi Fredik,

DRM do have fb_helper providing FB console.

I think refactor your current FB driver with drm gem cma helper won't be 
very hard.

>
> Standard hardware, on its part, does not have a serial port or similar
> alternatives that could easily function as a console, unfortunately.

Ahh, the guy runs Linux on that gaming console is really cool! How do 
you debug your code?

Thanks.

--
Jiaxun Yang

