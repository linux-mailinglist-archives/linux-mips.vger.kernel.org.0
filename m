Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD3E2C1041
	for <lists+linux-mips@lfdr.de>; Sat, 28 Sep 2019 10:52:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbfI1Iwi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Sep 2019 04:52:38 -0400
Received: from forward104o.mail.yandex.net ([37.140.190.179]:37115 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725856AbfI1Iwh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 28 Sep 2019 04:52:37 -0400
Received: from mxback23o.mail.yandex.net (mxback23o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::74])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 4A78A940090;
        Sat, 28 Sep 2019 11:52:34 +0300 (MSK)
Received: from sas8-93a22d3a76f4.qloud-c.yandex.net (sas8-93a22d3a76f4.qloud-c.yandex.net [2a02:6b8:c1b:2988:0:640:93a2:2d3a])
        by mxback23o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 1gCcRH8Ysn-qXliDdFq;
        Sat, 28 Sep 2019 11:52:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1569660754;
        bh=vRF5Tkp240cQ5fSdDrArQ2fiMS69xhiYtJf0hJBeT+4=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=UcyKVt/yV8FglmbKip4x1vjnA7egeE5LkNR5NdYaHPq0ppERm+1mCxkauL2i2EHsr
         dRoEJST5zqInr+uKnn70lkwg5IRllZBM6SyTGCg1C+ogCoxqUCJuQ5bIirkwIauZLR
         ojMF/RpSb6eOryC/BbwElrMh0QIcC4G8EeNAw1mU=
Authentication-Results: mxback23o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by sas8-93a22d3a76f4.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id JAUu2lHH1A-qVI4hKwk;
        Sat, 28 Sep 2019 11:52:32 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH] MIPS: Loongson64: Remove duplicated add_memory_region
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>
References: <20190926140458.10367-1-jiaxun.yang@flygoat.com>
 <CAAhV-H4H5dXZCL_P7+o+SR1dVGchbyvCAqvHyac9i4-7-esoCQ@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <55580733-11eb-4bae-55b2-0ce5ff0a7694@flygoat.com>
Date:   Sat, 28 Sep 2019 16:52:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H4H5dXZCL_P7+o+SR1dVGchbyvCAqvHyac9i4-7-esoCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/9/27 下午6:36, Huacai Chen wrote:
> Hi Jiaxun and Paul,
>
> This patch isn't a complete fix, please refer to
> https://patchwork.kernel.org/patch/11164281/.

Hi Paul,

Please pick Huacai's patch as a material of rc1.

Thanks

--

Jiaxun Yang

> Huacai
