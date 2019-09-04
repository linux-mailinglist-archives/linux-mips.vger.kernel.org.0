Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECF5CA7B36
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 08:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728236AbfIDGIz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 02:08:55 -0400
Received: from forward104p.mail.yandex.net ([77.88.28.107]:45293 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726045AbfIDGIz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 02:08:55 -0400
Received: from mxback17g.mail.yandex.net (mxback17g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:317])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id 64ECB4B00823;
        Wed,  4 Sep 2019 09:08:52 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [2a02:6b8:0:1a2d::28])
        by mxback17g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id scxRs21PbP-8pVObtAP;
        Wed, 04 Sep 2019 09:08:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567577332;
        bh=63Nzj/rJTv0SfwKp8FEmdqXh2tkTmqjb4gPgRgauuok=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=B/p8cViOIU2zBkr/CTbNzQckT+zJkChO2PFAjVr/3f9mP+ejuRllVo84y/NuiegVn
         q5yYttng5pI6A2l331sNJ1N7xSAmHImdwa+ofNWQzvsiJ7pqwD2I1NhrnzyaZYs4ZO
         G68ack765oywHhfBiF1LQyAHxWR0Y+Zy1tFK40X0=
Authentication-Results: mxback17g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id aVxXNVqQqQ-8WeaTxpo;
        Wed, 04 Sep 2019 09:08:40 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH v1 14/18] MIPS: Loongson64: Add generic dts
To:     =?UTF-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>,
        linux-mips <linux-mips@vger.kernel.org>
Cc:     "paul.burton" <paul.burton@mips.com>, tglx <tglx@linutronix.de>,
        jason <jason@lakedaemon.net>, maz <maz@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        robh+dt <robh+dt@kernel.org>,
        "mark.rutland" <mark.rutland@arm.co>,
        devicetree <devicetree@vger.kernel.org>,
        Huacai Chen <chenhuacai@gmail.com>
References: <20190830043232.20191-1-jiaxun.yang@flygoat.com>
 <20190830043232.20191-9-jiaxun.yang@flygoat.com>
 <tencent_1942EDDF41E4786E357A4E9D@qq.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <afdce123-385c-96b9-de78-e3a4dee23b29@flygoat.com>
Date:   Wed, 4 Sep 2019 14:08:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <tencent_1942EDDF41E4786E357A4E9D@qq.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2019/9/4 11:44, 陈华才 写道:
> Hi, Jiaxun,
>
> 1, There are too many dts files (all cputype/boardtype/n-ways combinations), in my opinon we don't need to distinguish 1way/2way/4way. In this way we can largely reduce dts files.
>
> 2, Please don't use "ls" to stand-for loongson, at least in file names.

Thanks, I'm going to drop cpu node in v2.

Renaming files seems meaningless, but I'm going to do that too.

-- 

Jiaxun Yang

