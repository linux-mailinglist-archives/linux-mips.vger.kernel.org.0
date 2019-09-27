Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4F8BFDF1
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2019 06:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbfI0EUf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Sep 2019 00:20:35 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:54460 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfI0EUe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Sep 2019 00:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Date:Message-ID:From:Cc:To:Subject;
         bh=yUHrHSqCX11t6h9R2eGN5jMI/UGIN1mCUqRpf51dMu8=; b=wMH4UIEiXrvqMYvDtgWhbdM9r
        z2tgzkiEOxlwsPoQcKKZIT198NsUTU7HAAD9S2tMS68KKZVgOleBJNElC/qsKFx+mngcmBUUylCtY
        rVea8O6w6JLjdMev0WgBCk3DT4SgOQdcrwSTHvJsnzC9g6BbcKfMV2pO4OP6BcQZoxGeriZlxPTgg
        RhLgHVKtf8YPTC7BA5HUQllYT1vnj7VsPZc9ku4hfgyQ8OwHtvWXk1T2+VHlGAmURYPdfD48Wjfgc
        1eDocUEpUUqdzTkbUDFrOBWhvnIW9c5GAQghJeCLPs6O9O1kwbZNDYn59HWL9hsXGSRJEFwepzuO1
        rS1/eXvHA==;
Received: from [2001:41d0:fe79:6701::b64]
        by srv1.deutnet.info with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iDhk6-0006La-1b; Fri, 27 Sep 2019 06:20:30 +0200
Subject: Re: [PATCH 1/4] MIPS: CI20: DTS: Add I2C nodes
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, robh+dt@kernel.org, mark.rutland@arm.com,
        ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <3f74e79546aff3e2f77e94361685d53f4e44fa7b.1569181001.git.agriveaux@deutnet.info>
 <201909231038.WLeaU93z%lkp@intel.com>
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
Openpgp: preference=signencrypt
Autocrypt: addr=agriveaux@deutnet.info; prefer-encrypt=mutual; keydata=
 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
 z6YGVVQX+YQhrew=
Message-ID: <9669145c-ba55-c079-cbd3-f61ffdff7450@deutnet.info>
Date:   Fri, 27 Sep 2019 06:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201909231038.WLeaU93z%lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Content-Language: fr
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

> Hi Alexandre,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on linus/master]
> [cannot apply to v5.3 next-20190920]
> [if your patch is applied to the wrong git tree, please drop us a note =
to help
> improve the system. BTW, we also suggest to use '--base' option to spec=
ify the
> base tree in git format-patch, please see https://stackoverflow.com/a/3=
7406982]
>
> url:    https://github.com/0day-ci/linux/commits/Alexandre-GRIVEAUX/MIP=
S-CI20-DTS-Add-nodes-to-Creator-CI20-board/20190923-041656
> config: mips-allmodconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.4.0 make.cross ARCH=3Dmips=20
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:90.1-6 Label or path i2c0 =
not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:168.1-6 Label or path i2c1=
 not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:176.1-6 Label or path i2c2=
 not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:184.1-6 Label or path i2c3=
 not found
>>> Error: arch/mips/boot/dts/ingenic/ci20.dts:192.1-6 Label or path i2c4=
 not found
>    FATAL ERROR: Syntax error parsing input tree
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology =
Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpo=
ration

Do I need to add the patch "[PATCHv4] MIPS: JZ4780: DTS: Add I2C nodes"
to=A0 the begin of this patchset ?


Thanks.


