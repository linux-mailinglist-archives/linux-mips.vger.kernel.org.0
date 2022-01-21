Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE061495CD2
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jan 2022 10:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379732AbiAUJ1o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jan 2022 04:27:44 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:2959 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379647AbiAUJ1m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jan 2022 04:27:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1642757260; x=1674293260;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wvAGSSkbD8sKVKozj06LSLUZ8DGhuMSqNCuuyy1l4Tg=;
  b=Coe/ygb6UeSSC7sC42jBUlxiSZGiukWTD79W5wEF/6DYpn411/I2GkgM
   pXT0tvsNrK42Y40NmgoEzD8RjvJ0Lay3nSUNLXGW23/W2HmXkLXhzdm9I
   ujEMEKcYq/5wfmtbBD4l5iKBb5NAmb3cF879pz5a9rOQ9Kg9QBY+EXF7s
   Nox6fG8MUff3RTnTVQY4NdZBo9jDgNW33h8serivsuB4v6bWRPRkqIj1S
   OtRMeA1Yq4maadhxNRBeDXeZJkwv9ZkUcV5mnymfErgJ9OaIqAWGPKgxF
   6rckhd/3sBs89cYRWcrl1w80ReH5ju9B2tQK3CjnKRm/ZKU7r56EPV25H
   A==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; 
   d="scan'208";a="195827693"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 17:27:38 +0800
IronPort-SDR: DEUsl/FWwn+r66xqzQlj5HzvER3GV49q9wpqNdFrTeKepENoxAMjq/bLwR/Npm8hCq8yEmWeJL
 UeXQmR7JpRCAEeY3/1AnWzzhweK9tYH3nz/0oFAJuNhG9lA4v5/L1o6cxSnuDplykIUFzZ8R07
 SLzn9cJ5F9Iiw00qmhfnzMQVGYSNsxLSGECdWB4xAQqN988J3/lJC/3LtWmu0ikGlPTpPG4StY
 HgiTvadTbl/7pk40vs1WtxCNRSXuSq+qORijuhxIIp4DoQY37ojGSKDu3cNSQ++V79K8bcE3Mf
 /fDLML9mkfNTohuuOX57nuhw
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 00:59:50 -0800
IronPort-SDR: csNvYaExSarmkYb7pBr+i9sDtkOWDqOBFiIIKcRMQkd7gxlh5BMAhEuHoGFfH8DUtboAzKBHY2
 RdacZncAb7s80jokSE2jZbo08SquPAi4eTm/hD/eE0sy6Bjvf7yjHhIKaxHO+nwd9oEWald86j
 VfHQQ4OIJh8pJtOc1KWxFTTPsbxPcHZQLxECbqgsPA6Nwp8FISMALM18fG33xsKDhE6enu7ENB
 8hlfTXJZ53lffVk7BJAy9hES9z8TWy0TXGtvec+cGB9osoabZV2X3yRRMVYJbJZwWE9WR1z7Mv
 NBM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 01:27:39 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JgDYk25WQz1SVny
        for <linux-mips@vger.kernel.org>; Fri, 21 Jan 2022 01:27:38 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1642757257; x=1645349258; bh=wvAGSSkbD8sKVKozj06LSLUZ8DGhuMSqNCu
        uyy1l4Tg=; b=eH3Z965uTxH9B+Ybb9izm7AvFS75V8fAtbih7EcrBmg7M/fwcUl
        zPO5DnBIzdU5y2lrgu4Toooa2iwJ80SvIeOybdNsW2ZCtiztoVPnkBiW+WGnXsCF
        rt1FhRMpYD88Dj5WRfDmAFbslsE3tgUxc+Fr6VJqVCN/9qbFUeTGceLrudBjI1aU
        sdvxSCmFi568o65dcF8bo1LwSeDImocsGkIEbnuHw/Bhtj6dZWRDbB2WM2DNWD+s
        SKh0qfGhm1+18rMesxGU5cTyK4ESN8u4o6fAtuD88a3tw8r8IrnAfIzUWnSImuKi
        xsfnz+gHr8NdGnoX1OkyQGMOLelsLgwoJCQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id d9Oak9iv8beR for <linux-mips@vger.kernel.org>;
        Fri, 21 Jan 2022 01:27:37 -0800 (PST)
Received: from [10.225.163.53] (unknown [10.225.163.53])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JgDYg5LFjz1RvlN;
        Fri, 21 Jan 2022 01:27:35 -0800 (PST)
Message-ID: <11ec9f44-5e1c-c4cd-8d63-93d7538a12c8@opensource.wdc.com>
Date:   Fri, 21 Jan 2022 18:27:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
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
Organization: Western Digital Research
In-Reply-To: <CA+G9fYu__OOvk-ESXoOqbd-Lk+CmO8CSQ8chEFf3MyeTjKtp9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/21/22 17:58, Naresh Kamboju wrote:
>> I just posted a fix. As I do not have the environment to compile test
>> mips, could someone test please ? I will send the fix to Linus asap
>> after confirmation that it is OK.
> 
> Please share your patch / patch link. I will test it with tuxmake.
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

Just tried this and it all passes for me.

> 
> - Naresh


-- 
Damien Le Moal
Western Digital Research
