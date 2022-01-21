Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11D73495CA5
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jan 2022 10:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244436AbiAUJRY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jan 2022 04:17:24 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9289 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379698AbiAUJRW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jan 2022 04:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1642756642; x=1674292642;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=DDt33//J7HC81vPepGQWceRVhDsuFSNWZ9d7bVsT2sk=;
  b=cYTr5QDlqnvFLR65W0wYsf6+AbHn/zxLKn0C8USNs2di9MjatVpHLJAB
   bOshWTNpYqaprNLuaGzuFYC1nVV9Yy8YKDnnZ+gOiSR+UfE0si6bwDr+I
   VfO7v/JKjoqt/BVg8+xlfgNvlIFmA2eaMutILIdDRTUrv+2oDu1hA+FMh
   LxerqwHEn/HUPbGxy3QdlEz+VFHCCJHY4WHNd/KH2/CIhOvrE8Tg+p3g0
   Ito5yOw4rQDtZyWPqAY32LgAkDwgkizvcNuxqBO9Rm9Sa21o3cRSZQOqb
   zTwUcWhvIsxT9e5hc1w/h0bSzL/t7rki9hzIh1Odvsa7jk6mhswy//7v6
   w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; 
   d="scan'208";a="295096772"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 17:17:17 +0800
IronPort-SDR: p8KcA42SA+tTtI5KbEPa3yH5RdpXDsQoLxNVfc1lKLed27uFNDEdZlcy+RON8lZ08kv2hFZFKU
 J1k4ViwM7K32Qq26MhVOi1lCZCo3ffI66K+mGi6uYh+YF88sr2VYYCO+P40OnBhQI3uOiHXBfu
 d1dtlQGpeBLV5boMJTdQRQr1SDy0WdQ4r9mpua//lgi1fmCnDdCFXsd1qzJtbqZe1LHktnTui8
 mQnqEwM96zaevQl0ofeoQlHHZAA8Ks5T6dcz6gogp/sNwRnOcO8g7JSfV8YtJVDlhenxcHbXII
 ferBjll4NPhpxHMTCHhiGDUB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:49:28 -0800
IronPort-SDR: ecuh9msgzq3y/HYUbAUFFQBF4AcDjEeOjxMnEh/d7Xj9Z4y14NLwCa6gVUiXdZVdW7SOX7tQ6G
 VptrncPrcnbzuUdXin1+JYfRGUJh0tXno3hk0qiHFLZQIkmRyJ2lSkxK4e2+WdVfA/uL3ySYFB
 V8R6QJqoDi89tmNxHYz8xDDU7TTfSMQvh6GRzR9APo3wHO6y+BKhUWugnxWZ0BnVKUhmgJmWQi
 ah/i16+ZEMQEeZZheeSPix/N+35uDmINyJ7ScYpvyZJdnK7Bu3Jf8kRjtOrCnT29PbUP/FFpJb
 XcY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:17:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JgDKm3vjZz1SVny
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 01:17:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1642756635; x=1645348636; bh=DDt33//J7HC81vPepGQWceRVhDsuFSNWZ9d
        7bVsT2sk=; b=JJ1bWH54T0ozCRDNFOawIcDYYrXmiS6mLF3bufMWI8NIa+2kaQT
        gCBgwenjhfSIESElInLy4f7hnR7B/c8AlmdP0YJlB/yBcj4ZSDRucj/ARZ8iebTx
        fX4cav++QB5+nrjZ/xNlR7WsOefucQ/VKRddYsk1OsSGfjMxLK9ouF+vHs+ICHA7
        QaQ2sHdGGswVwNNN4/NAuldiTPB3O2e4rjI+PHGvCgubY6wPSEdLOP7NfwwXL43W
        0XkAgLTCQC9ZIavzM31zb7IlI4uGbI4OgvYnMIVfBXIQVP013Dxgw+JTtTEtRqj5
        CB028YmS/z+ll5kfBZyeWV7wOCiloVbazWA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id q-OYoiNV1TeX for <linux-mips@vger.kernel.org>;
        Fri, 21 Jan 2022 01:17:15 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JgDKk0DRvz1RvlN;
        Fri, 21 Jan 2022 01:17:13 -0800 (PST)
Message-ID: <350720e8-9b78-bd24-5c60-602076610bf4@opensource.wdc.com>
Date:   Fri, 21 Jan 2022 18:17:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [next] mips: cavium_octeon_defconfig: pata_octeon_cf.c:598:23:
 error: passing argument 1 of 'trace_ata_bmdma_stop' from incompatible pointer
 type
Content-Language: en-US
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     "open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" 
        <linux-ide@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Zeal Robot <zealci@zte.com.cn>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        CGEL ZTE <cgel.zte@gmail.com>
References: <CA+G9fYtq0wzSeG8YG-a+=KrbdWqHJMXk1hvq0FKeAvj9sZAK2g@mail.gmail.com>
 <6249735f-e6b7-1331-eb2b-361bb17d6115@opensource.wdc.com>
 <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2022/01/21 17:58, Naresh Kamboju wrote:
>> I just posted a fix. As I do not have the environment to compile test
>> mips, could someone test please ? I will send the fix to Linus asap
>> after confirmation that it is OK.
> 
> Please share your patch / patch link. I will test it with tuxmake.

I posted on linux-ide and CC-ed linux-mips:

https://marc.info/?l=linux-ide&m=164275458614058&w=2

> 
> you may also give a try with these easy steps.
> 
> # To install tuxmake on your system globally:
> # sudo pip3 install -U tuxmake
> #
> # See https://docs.tuxmake.org/ for complete documentation.
> # Original tuxmake command with fragments listed below.
> 
>  tuxmake --runtime podman --target-arch mips --toolchain gcc-10
> --kconfig cavium_octeon_defconfig

I saw this in the compilation error report. Will try this.

> 
> - Naresh


-- 
Damien Le Moal
Western Digital Research
