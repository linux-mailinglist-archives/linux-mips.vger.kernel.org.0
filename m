Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C7A3B5ABA
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 10:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhF1Ixg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 04:53:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232317AbhF1Ixg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 04:53:36 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535F8C061574;
        Mon, 28 Jun 2021 01:51:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id a18so9032543lfs.10;
        Mon, 28 Jun 2021 01:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6CQc3fjMKRlg2zFck9NVYvnTowyzhWDlLGttHVE+IT0=;
        b=LmcZ0jiAiBKGXMLwtYKO/EYri7cHt5Bvayb4f0hQ75ZkfuJJcrhp/xfOABHhU4PnHx
         245CIGHulSluzEciPc/aIzxqvlKU7KWYJCToRPhcIdvb2iapfHftiWOZWpMQ3vc7jNtO
         DeCeEQQd7nWcUb9NcXgGXsqSAcqPK1EhX+dd1pHHja3s2BDmt5TD4JTqHoM9iEZ2NBeW
         Ndny8p0LUr4/J4qkSyibbLvuP2HVBbdvGTKxlcGpMqi1tF9doo7D4g7INLlNjC3V0dAT
         qI66ER1+5aSBA22ELp2R/gGNJ46eOd8qpZFuB4QlOXh+1Zm6B58kvvKVgB8s1ZZA33bb
         fsDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6CQc3fjMKRlg2zFck9NVYvnTowyzhWDlLGttHVE+IT0=;
        b=EdIfaz45BOrKex7y+Q7ZmE5tVW/edEY7fWVTuSCsDUhZuk+RXn1G3j6NhPR8B7JXbr
         +nA4z3AJnshKKlUv7S7d7dzASUy679q9eS1M7M6NTYoywURzatK6VNY8AS5qrNKchJje
         iAPztr6yuHm0r3Y7znkF5u4VnX8Ctd89PAgMiDEoofV2qhGTiV5XnaiUXX4DWtBTXJVY
         7PTZz+UXxbyYzWVwjyRNIy1U87woEvc5hJZRYQ+M2Csyw5JpqBmdeDDFHIcylbK9VU6U
         PqpYq8m/zx4FxJvFCq45ZxgMIIuu2k5Wrm+cyV63b2Rwri/9P86kMvwWMu7S/IbOjfi3
         0oIw==
X-Gm-Message-State: AOAM532NwLSuxM6g3H8gv7O0XqfsQo5/siEZiH4E8vel/ll1RGTVqg05
        7UK5QpfXcHLXCsPP6O5sI/+D6+997jg=
X-Google-Smtp-Source: ABdhPJzvVYPUkB9VP7TcqaQrYRa1aNqdVW+8tP5bkUyUBEczMrgHYJrEWtU2lQtNRxG4HlVwSj3spA==
X-Received: by 2002:a05:6512:3f1:: with SMTP id n17mr7379524lfq.355.1624870267515;
        Mon, 28 Jun 2021 01:51:07 -0700 (PDT)
Received: from [192.168.1.100] ([31.173.86.7])
        by smtp.gmail.com with ESMTPSA id i4sm1255288lfo.308.2021.06.28.01.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 01:51:07 -0700 (PDT)
Subject: Re: [PATCH v2] mm: Fix the problem of mips architecture Oops
To:     zhanglianjie <zhanglianjie@uniontech.com>, jiaxun.yang@flygoat.com,
        chenhuacai@kernel.org, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210628054738.10964-1-zhanglianjie@uniontech.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <d49404ca-b55c-847d-968d-273ca604b1e6@gmail.com>
Date:   Mon, 28 Jun 2021 11:51:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628054738.10964-1-zhanglianjie@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 28.06.2021 8:47, zhanglianjie wrote:

> The cause of the problem is as follows:
> 1. when cat /sys/devices/system/memory/memory0/valid_zones,
>     test_pages_in_a_zone() will be called.
> 2. test_pages_in_a_zone() finds the zone according to stat_pfn = 0.
>     The smallest pfn of the numa node in the mips architecture is 128,
>     and the page corresponding to the previous 0~127 pfn is not
>     initialized (page->flags is 0xFFFFFFFF)
> 3. The nid and zonenum obtained using page_zone(pfn_to_page(0)) are out
>     of bounds in the corresponding array,
>     &NODE_DATA(page_to_nid(page))->node_zones[page_zonenum(page)],
>     access to the out-of-bounds zone member variables appear abnormal,
>     resulting in Oops.
> Therefore, it is necessary to keep the page between 0 and the minimum
> pfn to prevent Oops from appearing.
> 
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> ---
>   arch/mips/loongson64/numa.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index fa9b4a487a47..dba9e6f17b9e 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -129,6 +129,9 @@ static void __init node_mem_init(unsigned int node)
>   		if (node_end_pfn(0) >= (0xffffffff >> PAGE_SHIFT))
>   			memblock_reserve((node_addrspace_offset | 0xfe000000),
>   					 32 << 20);
> +
> +		/* Reserver pfn range 0~node[0]->node_start_pfn */

    Reserve?

> +		memblock_reserve(0, PAGE_SIZE * start_pfn);
>   	}
>   }
[...]

MBR, Sergei
