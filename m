Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE4E7A756F
	for <lists+linux-mips@lfdr.de>; Wed, 20 Sep 2023 10:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbjITIKm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Sep 2023 04:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230447AbjITIKk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Sep 2023 04:10:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74477A1;
        Wed, 20 Sep 2023 01:10:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17F2EC433CB;
        Wed, 20 Sep 2023 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695197434;
        bh=5QGF9jO+picAJCyh1LF0QAqayO5CNA9tItx4EwVp9AY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=I4QlK9RfxOewAnXIxhXN7ZZHSZ0ppyEkYpFPATCfuLcFbGBLrqm607DpaptjkvIpR
         xzCRKtSm835A3JX86ufWg4Gz0z8DCCYmxMzVryXJHDuw7qMYiyBCeXSljN7YPB8oJl
         qr6712Hy568JhFmGq2f1j3JWZXI523oEL2W3Tum6dvIgfFFNuG42zX5d3RILVFyEKH
         iWTIXiJ+UV1WX3Ocgk01l+fIl65vKF5FwzgAUG5FWnJRsEIoWYNMwzCqrzzUD+7rLV
         PAFU/WaNetScbMikq8K1GewRJomxnbCToX5roKcgJZdPe8BCRpAznbDf2DUlllDWNI
         zWRrgfc7Bzivw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8679C561EE;
        Wed, 20 Sep 2023 08:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/54] net: ethernet: Convert to platform remove
 callback returning void
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169519743387.8735.12103555736777221473.git-patchwork-notify@kernel.org>
Date:   Wed, 20 Sep 2023 08:10:33 +0000
References: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, grygorii.strashko@ti.com,
        linux-omap@vger.kernel.org, bagasdotme@gmail.com,
        yangyingliang@huawei.com, gerg@linux-m68k.org, arnd@arndb.de,
        netdev@vger.kernel.org, kernel@pengutronix.de, afaerber@suse.de,
        mani@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, andreas@gaisler.com,
        wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-sunxi@lists.linux.dev, joyce.ooi@intel.com,
        Shyam-sundar.S-k@amd.com, bhupesh.sharma@linaro.org,
        elder@linaro.org, wei.fang@nxp.com, robh@kernel.org,
        iyappan@os.amperecomputing.com, keyur@os.amperecomputing.com,
        quan@os.amperecomputing.com, rauji.raut@gmail.com, heiko@sntech.de,
        horms@kernel.org, linux-rockchip@lists.infradead.org,
        chris.snook@gmail.com, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, rafal@milecki.pl,
        bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com,
        lizetao1@huawei.com, Steen.Hegelund@microchip.com,
        lukas.bulwahn@gmail.com, nicolas.ferre@microchip.com,
        claudiu.beznea@tuxon.dev, linux@armlinux.org.uk,
        mkl@pengutronix.de, hsweeten@visionengravers.com,
        ruanjinjie@huawei.com, ulli.kroll@googlemail.com,
        linus.walleij@linaro.org, kvalo@kernel.org, nhuck@google.com,
        gerhard@engleder-embedded.com, maciej.fijalkowski@intel.com,
        alexanderduyck@fb.com, fercerpav@gmail.com, saproj@gmail.com,
        vladimir.oltean@nxp.com, yisen.zhuang@huawei.com,
        salil.mehta@huawei.com, tsbogend@alpha.franken.de,
        michal.kubiak@intel.com, dougmill@linux.ibm.com, nathan@kernel.org,
        ruc_gongyuanjun@163.com, zhangchangzhong@huawei.com,
        hauke@hauke-m.de, kgugala@antmicro.com, mholenko@antmicro.com,
        gsomlo@gmail.com, joel@jms.id.au, sebastian.hesselbarth@gmail.com,
        thomas.petazzoni@bootlin.com, mw@semihalf.com, michael@walle.cc,
        andrew@lunn.ch, rmk+kernel@armlinux.org.uk,
        krzysztof.kozlowski@linaro.org, nbd@nbd.name, john@phrozen.org,
        sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
        lorenzo@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com,
        linux-mediatek@lists.infradead.org, asmaa@nvidia.com,
        davthompson@nvidia.com, horatiu.vultur@microchip.com,
        UNGLinuxDriver@microchip.com, lars.povlsen@microchip.com,
        daniel.machon@microchip.com, shangxiaojing@huawei.com,
        linqiheng@huawei.com, claudiu.manoil@nxp.com,
        alexandre.belloni@bootlin.com, YKarpov@ispras.ru, vz@mleia.com,
        timur@kernel.org, s.shtylyov@omp.ru, geert+renesas@glider.be,
        yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
        biju.das.jz@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
        bh74.an@samsung.com, ralf@linux-mips.org,
        linux-mips@vger.kernel.org, nico@fluxnic.net,
        steve.glendinning@shawell.net, andriy.shevchenko@linux.intel.com,
        jaswinder.singh@linaro.org, ilias.apalodimas@linaro.org,
        hayashi.kunihiko@socionext.com, harshit.m.mogalapalli@oracle.com,
        wellslutw@gmail.com, f.fainelli@gmail.com, tglx@linutronix.de,
        bigeasy@linutronix.de, shaozhengchao@huawei.com,
        kevinbrace@bracecomputerlab.com, romieu@fr.zoreil.com,
        michal.simek@amd.com, radhey.shyam.pandey@amd.com,
        harini.katakam@amd.com, xuhaoyue1@hisilicon.com,
        huangjunxian6@hisilicon.com, dan.carpenter@linaro.org,
        khalasa@piap.pl
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 18 Sep 2023 22:41:32 +0200 you wrote:
> Hello,
> 
> this series convert nearly all platform drivers below
> drivers/net/ethernet to use remove_new. The motivation is to get rid of
> an integer return code that is (mostly) ignored by the platform driver
> core and error prone on the driver side.
> 
> [...]

Here is the summary with links:
  - [net-next,01/54] net: ethernet: 8390: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/3c000faaaa65
  - [net-next,02/54] net: ethernet: actions: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d8c6b3fc918d
  - [net-next,03/54] net: ethernet: aeroflex: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a0fbde8f647b
  - [net-next,04/54] net: ethernet: allwinner: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/9f07797c332e
  - [net-next,05/54] net: ethernet: altera: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d0b0245b84c9
  - [net-next,06/54] net: ethernet: amd: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/9ecae52f7db4
  - [net-next,07/54] net: ethernet: apm: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/61471264c018
  - [net-next,08/54] net: ethernet: apple: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e5d0a380b2b4
  - [net-next,09/54] net: ethernet: arc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/de0afa130ed6
  - [net-next,10/54] net: ethernet: atheros: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/c6e817838902
  - [net-next,11/54] net: ethernet: broadcom: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d4295df3e043
  - [net-next,12/54] net: ethernet: cadence: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/6b5940402f9c
  - [net-next,13/54] net: ethernet: calxeda: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ca76b17922e6
  - [net-next,14/54] net: ethernet: cavium: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/de413f46a56e
  - [net-next,15/54] net: ethernet: cirrus: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/8ca0ae6a2ec7
  - [net-next,16/54] net: ethernet: cortina: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/1f69574b5cba
  - [net-next,17/54] net: ethernet: davicom: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ffb928290ba5
  - [net-next,18/54] net: ethernet: dnet: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/5db6c1fed1f9
  - [net-next,19/54] net: ethernet: engleder: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d2e6c2ea996e
  - [net-next,20/54] net: ethernet: ethoc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/4cc08098d197
  - [net-next,21/54] net: ethernet: faraday: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/dc715af33b42
  - [net-next,22/54] net: ethernet: hisilicon: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e5835a0a5119
  - [net-next,23/54] net: ethernet: i825xx: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e5a6d397ca2e
  - [net-next,24/54] net: ethernet: ibm: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ac35a3c4c8da
  - [net-next,25/54] net: ethernet: korina: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/551598a120d1
  - [net-next,26/54] net: ethernet: lantiq_etop: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e791aa06a2dd
  - [net-next,27/54] net: ethernet: lantiq_xrx200: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/adbb270655a1
  - [net-next,28/54] net: ethernet: litex: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/36b80b8353af
  - [net-next,29/54] net: ethernet: marvell: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/fee02f498c9a
  - [net-next,30/54] net: ethernet: mediatek: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/5b6ce1734d9d
  - [net-next,31/54] net: ethernet: mellanox: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e184700959ec
  - [net-next,32/54] net: ethernet: micrel: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/bae04ae2be07
  - [net-next,33/54] net: ethernet: microchip: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/5253ae3a6223
  - [net-next,34/54] net: ethernet: moxa:: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/253f9c47273d
  - [net-next,35/54] net: ethernet: mscc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/0eaca7a9e9d6
  - [net-next,36/54] net: ethernet: natsemi: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/9f0243d9bcc4
  - [net-next,37/54] net: ethernet: natsemi: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/b83fb509c758
  - [net-next,38/54] net: ethernet: ni: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/0f09f4e7d401
  - [net-next,39/54] net: ethernet: nxp: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/241882d79f99
  - [net-next,40/54] net: ethernet: qualcomm: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/5180236592b9
  - [net-next,41/54] net: ethernet: renesas: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/0b4f04e2f60b
  - [net-next,42/54] net: ethernet: samsung: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/6e8b0ef7b389
  - [net-next,43/54] net: ethernet: seeq: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/02c74030beff
  - [net-next,44/54] net: ethernet: sgi: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/506a327ceaaa
  - [net-next,45/54] net: ethernet: smsc: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/e8e2c863f941
  - [net-next,46/54] net: ethernet: socionext: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d3cd32451c7e
  - [net-next,47/54] net: ethernet: sun: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/8f4e45a0135e
  - [net-next,48/54] net: ethernet: sunplus: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/ede778ed3ea9
  - [net-next,49/54] net: ethernet: ti: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/231ea972ccaf
  - [net-next,50/54] net: ethernet: tundra: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2f961952e19e
  - [net-next,51/54] net: ethernet: via: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/70680f178280
  - [net-next,52/54] net: ethernet: wiznet: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/46b5668494d0
  - [net-next,53/54] net: ethernet: xilinx: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/2e0ec0afa902
  - [net-next,54/54] net: ethernet: xscale: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/d74a5c154b6f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


