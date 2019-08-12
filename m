Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D53896D1
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 07:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfHLF2j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 01:28:39 -0400
Received: from forward103o.mail.yandex.net ([37.140.190.177]:37017 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbfHLF2j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 01:28:39 -0400
Received: from mxback14o.mail.yandex.net (mxback14o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::65])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id 382C05F80D80;
        Mon, 12 Aug 2019 08:28:37 +0300 (MSK)
Received: from smtp1j.mail.yandex.net (smtp1j.mail.yandex.net [2a02:6b8:0:801::ab])
        by mxback14o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id o0VyJJeGmr-SZ2OicQv;
        Mon, 12 Aug 2019 08:28:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1565587717;
        bh=KYgIrBlA0MqCFD9D1XvYDzvt0sEn3coRMDLRsvt1SoI=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=DPowaHyAKMY8lVqxaqQftYqSLJPcwOKSL89foBjgqshqTuoomeOp10Ghnu90my5KV
         OusFv0CxLGEgbywKa0+hncoH1bEWcxiwh7BdOyknjM5afSEYWScIWEK6QEEnCgG/Yv
         btLMINBKS32stFuzOEOTBFrua8n4i+lj8hbdeXw4=
Authentication-Results: mxback14o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id YnhRiChbCB-STtGUTau;
        Mon, 12 Aug 2019 08:28:34 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [EXTERNAL]Drop boot_mem_map
To:     Paul Burton <paul.burton@mips.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "yasha.che3@gmail.com" <yasha.che3@gmail.com>,
        "aurelien@aurel32.net" <aurelien@aurel32.net>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "fancer.lancer@gmail.com" <fancer.lancer@gmail.com>,
        "matt.redfearn@mips.com" <matt.redfearn@mips.com>,
        "chenhc@lemote.com" <chenhc@lemote.com>
References: <20190808075013.4852-1-jiaxun.yang@flygoat.com>
 <20190812045618.ncqtfm6qmia6cxaz@pburton-laptop>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ac8efbfe-be18-ca91-2060-2a8c601cbbd1@flygoat.com>
Date:   Mon, 12 Aug 2019 13:28:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812045618.ncqtfm6qmia6cxaz@pburton-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/8/12 下午12:56, Paul Burton wrote:
> Hi Jiaxun,
>
> On Thu, Aug 08, 2019 at 03:50:06PM +0800, Jiaxun Yang wrote:
>> Hi there:
>> I was trying to make a generic NUMA implementation for ip27 and loongson-3,
>> and the boot_mem_map without nid support become a barrier of merging memory
>> init code.
>>
>> Rather than add nid support to boot_mem_map, this patchset drops the whole
>> boot_mem_map as it can be replaced by memblock functions.
> Very nice - cleaning this up will be a neat improvement :)
>
> Am I right to suspect though that patch 1 will break the build for all
> platforms that make use of boot_mem_map? (ie. all the platforms touched
> by later patches in this series)

Yes. Rest of the set should fixed all the platforms.

You can verify by grep boot_mem_map tree-wide.

--

Jiaxun Yang

