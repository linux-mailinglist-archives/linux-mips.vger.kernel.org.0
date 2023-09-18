Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62E997A5449
	for <lists+linux-mips@lfdr.de>; Mon, 18 Sep 2023 22:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjIRUoj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Sep 2023 16:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjIRUoi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 18 Sep 2023 16:44:38 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C1EB6
        for <linux-mips@vger.kernel.org>; Mon, 18 Sep 2023 13:44:32 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiL4x-0006iV-Nk; Mon, 18 Sep 2023 22:42:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiL4k-007IhV-K5; Mon, 18 Sep 2023 22:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qiL4k-002mnC-50; Mon, 18 Sep 2023 22:42:34 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
        kernel@pengutronix.de,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org,
        Andreas Larsson <andreas@gaisler.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-sunxi@lists.linux.dev, Joyce Ooi <joyce.ooi@intel.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Alex Elder <elder@linaro.org>, Wei Fang <wei.fang@nxp.com>,
        Rob Herring <robh@kernel.org>,
        Iyappan Subramanian <iyappan@os.amperecomputing.com>,
        Keyur Chudgar <keyur@os.amperecomputing.com>,
        Quan Nguyen <quan@os.amperecomputing.com>,
        Atul Raut <rauji.raut@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Simon Horman <horms@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Chris Snook <chris.snook@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Doug Berger <opendmb@gmail.com>,
        Li Zetao <lizetao1@huawei.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Russell King <linux@armlinux.org.uk>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kalle Valo <kvalo@kernel.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Gerhard Engleder <gerhard@engleder-embedded.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Alexander Duyck <alexanderduyck@fb.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Sergei Antonov <saproj@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michal Kubiak <michal.kubiak@intel.com>,
        Douglas Miller <dougmill@linux.ibm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Yuanjun Gong <ruc_gongyuanjun@163.com>,
        Zhang Changzhong <zhangchangzhong@huawei.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Gabriel Somlo <gsomlo@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marcin Wojtas <mw@semihalf.com>,
        Michael Walle <michael@walle.cc>, Andrew Lunn <andrew@lunn.ch>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org,
        Asmaa Mnebhi <asmaa@nvidia.com>,
        David Thompson <davthompson@nvidia.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        Qiheng Lin <linqiheng@huawei.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Yuri Karpov <YKarpov@ispras.ru>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Timur Tabi <timur@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Byungho An <bh74.an@samsung.com>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
        Nicolas Pitre <nico@fluxnic.net>,
        Steve Glendinning <steve.glendinning@shawell.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Wells Lu <wellslutw@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Zhengchao Shao <shaozhengchao@huawei.com>,
        Kevin Brace <kevinbrace@bracecomputerlab.com>,
        Francois Romieu <romieu@fr.zoreil.com>,
        Michal Simek <michal.simek@amd.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
        Harini Katakam <harini.katakam@amd.com>,
        Haoyue Xu <xuhaoyue1@hisilicon.com>,
        huangjunxian <huangjunxian6@hisilicon.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Halasa <khalasa@piap.pl>
Subject: [PATCH net-next 00/54] net: ethernet: Convert to platform remove callback returning void
Date:   Mon, 18 Sep 2023 22:41:32 +0200
Message-Id: <20230918204227.1316886-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12339; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uRL0xD4tSDbk8HBljakKJR0DpZM1z56i+WaCKgjL7Kk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlCLXkgHb1AYcXBsm+1AoNI9Zz8jTCH/W620zP1 6IbyUIVcSCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZQi15AAKCRCPgPtYfRL+ TjL4CACpgZdTUBHbAfkKPQoauoamflwuznvGP/dcoFsENWxzxBbtLfH0gbmcJ04pfaUb1DK5dBW YO4QKjUDWoYoUSneGv+deG/vcPg560G+Y5CDgpLT0YwLukZUD5uYyNZTxQlRTf675DhQByb4PCF m+MnMNJLSYH1uHImncdNbyWsFXDIi63fVKBqvkqz9HM8HBZ/SdE9hpsbQ/B1D49tMn+culsC6fz LH7duV3+tPcEf1ygOlVi6zvDLLIWfAWzyRiID9X93wWWMjGlJL5aAQJud/RLUfIs5k0CrlmhseN 9zRLNiIurYbtHwHEai7pwclDIy1u4elXf3JkJUD5j1yvAkhD
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

this series convert nearly all platform drivers below
drivers/net/ethernet to use remove_new. The motivation is to get rid of
an integer return code that is (mostly) ignored by the platform driver
core and error prone on the driver side.

There are 3 drivers I didn't convert (yet):

 drivers/net/ethernet/ti/cpsw.c
 drivers/net/ethernet/ti/cpsw_new.c
 drivers/net/ethernet/ti/am65-cpsw-nuss.c

These are a bit more complicated because they don't always return 0 in
.remove(). Unless someone is quicker than me, I'll address them in
separate patches at a later time.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies between the patches. As there are still
quite a few drivers to convert, I'm happy about every patch that makes
it in. So even if there is a merge conflict with one patch until you
apply, please apply the remainder of this series anyhow.

Best regards
Uwe

Uwe Kleine-König (54):
  net: ethernet: 8390: Convert to platform remove callback returning
    void
  net: ethernet: actions: Convert to platform remove callback returning
    void
  net: ethernet: aeroflex: Convert to platform remove callback returning
    void
  net: ethernet: allwinner: Convert to platform remove callback
    returning void
  net: ethernet: altera: Convert to platform remove callback returning
    void
  net: ethernet: amd: Convert to platform remove callback returning void
  net: ethernet: apm: Convert to platform remove callback returning void
  net: ethernet: apple: Convert to platform remove callback returning
    void
  net: ethernet: arc: Convert to platform remove callback returning void
  net: ethernet: atheros: Convert to platform remove callback returning
    void
  net: ethernet: broadcom: Convert to platform remove callback returning
    void
  net: ethernet: cadence: Convert to platform remove callback returning
    void
  net: ethernet: calxeda: Convert to platform remove callback returning
    void
  net: ethernet: cavium: Convert to platform remove callback returning
    void
  net: ethernet: cirrus: Convert to platform remove callback returning
    void
  net: ethernet: cortina: Convert to platform remove callback returning
    void
  net: ethernet: davicom: Convert to platform remove callback returning
    void
  net: ethernet: dnet: Convert to platform remove callback returning
    void
  net: ethernet: engleder: Convert to platform remove callback returning
    void
  net: ethernet: ethoc: Convert to platform remove callback returning
    void
  net: ethernet: faraday: Convert to platform remove callback returning
    void
  net: ethernet: hisilicon: Convert to platform remove callback
    returning void
  net: ethernet: i825xx: Convert to platform remove callback returning
    void
  net: ethernet: ibm: Convert to platform remove callback returning void
  net: ethernet: korina: Convert to platform remove callback returning
    void
  net: ethernet: lantiq_etop: Convert to platform remove callback
    returning void
  net: ethernet: lantiq_xrx200: Convert to platform remove callback
    returning void
  net: ethernet: litex: Convert to platform remove callback returning
    void
  net: ethernet: marvell: Convert to platform remove callback returning
    void
  net: ethernet: mediatek: Convert to platform remove callback returning
    void
  net: ethernet: mellanox: Convert to platform remove callback returning
    void
  net: ethernet: micrel: Convert to platform remove callback returning
    void
  net: ethernet: microchip: Convert to platform remove callback
    returning void
  net: ethernet: moxa:: Convert to platform remove callback returning
    void
  net: ethernet: mscc: Convert to platform remove callback returning
    void
  net: ethernet: natsemi: Convert to platform remove callback returning
    void
  net: ethernet: natsemi: Convert to platform remove callback returning
    void
  net: ethernet: ni: Convert to platform remove callback returning void
  net: ethernet: nxp: Convert to platform remove callback returning void
  net: ethernet: qualcomm: Convert to platform remove callback returning
    void
  net: ethernet: renesas: Convert to platform remove callback returning
    void
  net: ethernet: samsung: Convert to platform remove callback returning
    void
  net: ethernet: seeq: Convert to platform remove callback returning
    void
  net: ethernet: sgi: Convert to platform remove callback returning void
  net: ethernet: smsc: Convert to platform remove callback returning
    void
  net: ethernet: socionext: Convert to platform remove callback
    returning void
  net: ethernet: sun: Convert to platform remove callback returning void
  net: ethernet: sunplus: Convert to platform remove callback returning
    void
  net: ethernet: ti: Convert to platform remove callback returning void
  net: ethernet: tundra: Convert to platform remove callback returning
    void
  net: ethernet: via: Convert to platform remove callback returning void
  net: ethernet: wiznet: Convert to platform remove callback returning
    void
  net: ethernet: xilinx: Convert to platform remove callback returning
    void
  net: ethernet: xscale: Convert to platform remove callback returning
    void

 drivers/net/ethernet/8390/ax88796.c                  |  6 ++----
 drivers/net/ethernet/8390/mcf8390.c                  |  5 ++---
 drivers/net/ethernet/8390/ne.c                       |  5 ++---
 drivers/net/ethernet/actions/owl-emac.c              |  6 ++----
 drivers/net/ethernet/aeroflex/greth.c                |  6 ++----
 drivers/net/ethernet/allwinner/sun4i-emac.c          |  5 ++---
 drivers/net/ethernet/altera/altera_tse_main.c        |  6 ++----
 drivers/net/ethernet/amd/au1000_eth.c                |  6 ++----
 drivers/net/ethernet/amd/sunlance.c                  |  6 ++----
 drivers/net/ethernet/amd/xgbe/xgbe-platform.c        |  6 ++----
 drivers/net/ethernet/apm/xgene-v2/main.c             |  6 ++----
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c     |  6 ++----
 drivers/net/ethernet/apple/macmace.c                 |  6 ++----
 drivers/net/ethernet/arc/emac_arc.c                  |  6 ++----
 drivers/net/ethernet/arc/emac_rockchip.c             |  5 ++---
 drivers/net/ethernet/atheros/ag71xx.c                |  8 +++-----
 drivers/net/ethernet/broadcom/asp2/bcmasp.c          |  8 +++-----
 drivers/net/ethernet/broadcom/bcm4908_enet.c         |  6 ++----
 drivers/net/ethernet/broadcom/bcm63xx_enet.c         | 10 ++++------
 drivers/net/ethernet/broadcom/bcmsysport.c           |  6 ++----
 drivers/net/ethernet/broadcom/bgmac-platform.c       |  6 ++----
 drivers/net/ethernet/broadcom/genet/bcmgenet.c       |  6 ++----
 drivers/net/ethernet/broadcom/sb1250-mac.c           |  6 ++----
 drivers/net/ethernet/cadence/macb_main.c             |  6 ++----
 drivers/net/ethernet/calxeda/xgmac.c                 |  6 ++----
 drivers/net/ethernet/cavium/octeon/octeon_mgmt.c     |  5 ++---
 drivers/net/ethernet/cirrus/cs89x0.c                 |  5 ++---
 drivers/net/ethernet/cirrus/ep93xx_eth.c             |  8 +++-----
 drivers/net/ethernet/cirrus/mac89x0.c                |  5 ++---
 drivers/net/ethernet/cortina/gemini.c                | 12 ++++--------
 drivers/net/ethernet/davicom/dm9000.c                |  6 ++----
 drivers/net/ethernet/dnet.c                          |  6 ++----
 drivers/net/ethernet/engleder/tsnep_main.c           |  6 ++----
 drivers/net/ethernet/ethoc.c                         |  6 ++----
 drivers/net/ethernet/faraday/ftgmac100.c             |  5 ++---
 drivers/net/ethernet/faraday/ftmac100.c              |  5 ++---
 drivers/net/ethernet/hisilicon/hip04_eth.c           |  6 ++----
 drivers/net/ethernet/hisilicon/hisi_femac.c          |  6 ++----
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c        |  6 ++----
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_main.c   |  6 ++----
 drivers/net/ethernet/hisilicon/hns/hns_enet.c        |  5 ++---
 drivers/net/ethernet/hisilicon/hns_mdio.c            |  5 ++---
 drivers/net/ethernet/i825xx/sni_82596.c              |  5 ++---
 drivers/net/ethernet/ibm/ehea/ehea_main.c            |  8 +++-----
 drivers/net/ethernet/ibm/emac/core.c                 |  6 ++----
 drivers/net/ethernet/ibm/emac/mal.c                  |  6 ++----
 drivers/net/ethernet/ibm/emac/rgmii.c                |  6 ++----
 drivers/net/ethernet/ibm/emac/tah.c                  |  6 ++----
 drivers/net/ethernet/ibm/emac/zmii.c                 |  6 ++----
 drivers/net/ethernet/korina.c                        |  6 ++----
 drivers/net/ethernet/lantiq_etop.c                   |  6 ++----
 drivers/net/ethernet/lantiq_xrx200.c                 |  6 ++----
 drivers/net/ethernet/litex/litex_liteeth.c           |  6 ++----
 drivers/net/ethernet/marvell/mv643xx_eth.c           | 11 ++++-------
 drivers/net/ethernet/marvell/mvmdio.c                |  6 ++----
 drivers/net/ethernet/marvell/mvneta.c                |  6 ++----
 drivers/net/ethernet/marvell/mvneta_bm.c             |  6 ++----
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c      |  8 +++-----
 drivers/net/ethernet/marvell/pxa168_eth.c            |  5 ++---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c          |  6 ++----
 .../ethernet/mellanox/mlxbf_gige/mlxbf_gige_main.c   |  6 ++----
 drivers/net/ethernet/micrel/ks8842.c                 |  5 ++---
 drivers/net/ethernet/micrel/ks8851_par.c             |  6 ++----
 .../net/ethernet/microchip/lan966x/lan966x_main.c    |  6 ++----
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c  |  6 ++----
 drivers/net/ethernet/moxa/moxart_ether.c             |  6 ++----
 drivers/net/ethernet/mscc/ocelot_vsc7514.c           |  6 ++----
 drivers/net/ethernet/natsemi/jazzsonic.c             |  6 ++----
 drivers/net/ethernet/natsemi/macsonic.c              |  6 ++----
 drivers/net/ethernet/natsemi/xtsonic.c               |  6 ++----
 drivers/net/ethernet/ni/nixge.c                      |  6 ++----
 drivers/net/ethernet/nxp/lpc_eth.c                   |  6 ++----
 drivers/net/ethernet/qualcomm/emac/emac.c            |  6 ++----
 drivers/net/ethernet/renesas/ravb_main.c             |  6 ++----
 drivers/net/ethernet/renesas/rswitch.c               |  6 ++----
 drivers/net/ethernet/renesas/sh_eth.c                |  6 ++----
 drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c  |  6 ++----
 drivers/net/ethernet/seeq/sgiseeq.c                  |  6 ++----
 drivers/net/ethernet/sgi/ioc3-eth.c                  |  6 ++----
 drivers/net/ethernet/sgi/meth.c                      |  6 ++----
 drivers/net/ethernet/smsc/smc91x.c                   |  6 ++----
 drivers/net/ethernet/smsc/smsc911x.c                 |  6 ++----
 drivers/net/ethernet/socionext/netsec.c              |  6 ++----
 drivers/net/ethernet/socionext/sni_ave.c             |  6 ++----
 drivers/net/ethernet/sun/niu.c                       |  5 ++---
 drivers/net/ethernet/sun/sunbmac.c                   |  6 ++----
 drivers/net/ethernet/sun/sunqe.c                     |  6 ++----
 drivers/net/ethernet/sunplus/spl2sw_driver.c         |  6 ++----
 drivers/net/ethernet/ti/cpmac.c                      |  6 ++----
 drivers/net/ethernet/ti/davinci_emac.c               |  6 ++----
 drivers/net/ethernet/ti/davinci_mdio.c               |  6 ++----
 drivers/net/ethernet/ti/netcp_core.c                 |  5 ++---
 drivers/net/ethernet/tundra/tsi108_eth.c             |  6 ++----
 drivers/net/ethernet/via/via-rhine.c                 |  6 ++----
 drivers/net/ethernet/via/via-velocity.c              |  6 ++----
 drivers/net/ethernet/wiznet/w5100.c                  |  6 ++----
 drivers/net/ethernet/wiznet/w5300.c                  |  5 ++---
 drivers/net/ethernet/xilinx/ll_temac_main.c          |  5 ++---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c    |  6 ++----
 drivers/net/ethernet/xilinx/xilinx_emaclite.c        |  6 ++----
 drivers/net/ethernet/xscale/ixp4xx_eth.c             |  5 ++---
 101 files changed, 213 insertions(+), 399 deletions(-)


base-commit: 7fc7222d9680366edeecc219c21ca96310bdbc10
-- 
2.40.1

