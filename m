Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDCEE4736B
	for <lists+linux-mips@lfdr.de>; Sun, 16 Jun 2019 08:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfFPG6U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 16 Jun 2019 02:58:20 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:37699 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbfFPG6U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Jun 2019 02:58:20 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=SVR-IES-MBX-03.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hcP7H-0001ds-Ig from Cedric_Hombourger@mentor.com ; Sat, 15 Jun 2019 23:58:15 -0700
Received: from svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) by
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Sun, 16 Jun 2019 07:58:12 +0100
Received: from svr-ies-mbx-02.mgc.mentorg.com ([fe80::a01f:51c9:5b6c:e0c]) by
 svr-ies-mbx-02.mgc.mentorg.com ([fe80::a01f:51c9:5b6c:e0c%22]) with mapi id
 15.00.1320.000; Sun, 16 Jun 2019 07:58:11 +0100
From:   "Hombourger, Cedric" <Cedric_Hombourger@mentor.com>
To:     Sasha Levin <sashal@kernel.org>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: have "plain" make calls build dtbs for selected
 platforms
Thread-Topic: [PATCH] MIPS: have "plain" make calls build dtbs for selected
 platforms
Thread-Index: AQHVIcVrw5tGiAGyckKhKLs3W2AnEaadO4kAgACh3B8=
Date:   Sun, 16 Jun 2019 06:58:11 +0000
Message-ID: <1560668291651.87711@mentor.com>
References: <1560415970-844-1-git-send-email-Cedric_Hombourger@mentor.com>,<20190615221604.E6FB82183F@mail.kernel.org>
In-Reply-To: <20190615221604.E6FB82183F@mail.kernel.org>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.94.31.225]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Sasha,

Thanks a lot for testing all these configurations (and I apologize if I missed anything to fulfill the process to contribute to -stable)
I will check the configurations that fail and check if we just need to resolve the patch conflict(s). Should we mark the current patch as targeting v4.19+ and submit specific patches for < 4.19? Your guidance would be greatly appreciated

Thank you
Cedric
________________________________________
From: Sasha Levin <sashal@kernel.org>
Sent: Sunday, June 16, 2019 12:16 AM
To: Sasha Levin; Hombourger, Cedric
Cc: Hombourger, Cedric; linux-mips@vger.kernel.org; stable@vger.kernel.org; stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: have "plain" make calls build dtbs for selected platforms

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.1.9, v4.19.50, v4.14.125, v4.9.181, v4.4.181.

v5.1.9: Build OK!
v4.19.50: Build OK!
v4.14.125: Failed to apply! Possible dependencies:
    04d8405e714e ("MIPS: Set defconfig target to a generic system for 32r2el")

v4.9.181: Failed to apply! Possible dependencies:
    04d8405e714e ("MIPS: Set defconfig target to a generic system for 32r2el")

v4.4.181: Failed to apply! Possible dependencies:
    04d8405e714e ("MIPS: Set defconfig target to a generic system for 32r2el")
    aadeec4df9b3 ("MIPS: tools: Build relocs tool")


How should we proceed with this patch?

--
Thanks,
Sasha
