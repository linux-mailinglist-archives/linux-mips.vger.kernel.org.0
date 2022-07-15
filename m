Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E52A576195
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jul 2022 14:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiGOMa1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jul 2022 08:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbiGOMaW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Jul 2022 08:30:22 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B5E13D76;
        Fri, 15 Jul 2022 05:30:21 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FAnJgD026918;
        Fri, 15 Jul 2022 08:30:21 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37teb3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Jul 2022 08:30:21 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCUIoH061424
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 Jul 2022 08:30:18 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 15 Jul
 2022 08:30:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:30:17 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxOA001007;
        Fri, 15 Jul 2022 08:30:06 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <chrome-platform@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-arm-msm@vger.kernel.org>
CC:     Gwendal Grignou <gwendal@chromium.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Fair <benjaminfair@google.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Patrick Venture <venture@google.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Benson Leung <bleung@chromium.org>,
        Nancy Yuen <yuenn@google.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Christophe Branchereau <cbranchereau@gmail.com>,
        Cai Huoqing <cai.huoqing@linux.dev>,
        Avi Fishman <avifishman70@gmail.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Andy Gross <agross@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Haibo Chen <haibo.chen@nxp.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: [PATCH v3 14/15] iio: inkern: remove OF dependencies
Date:   Fri, 15 Jul 2022 14:29:02 +0200
Message-ID: <20220715122903.332535-15-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: uehSCiJQwF0lJ4Y9RJTlPVMFUgiTkVhA
X-Proofpoint-ORIG-GUID: uehSCiJQwF0lJ4Y9RJTlPVMFUgiTkVhA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=854 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150054
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Since all users of the OF dependendent API are now converted to use the
firmware agnostic alternative, we can drop OF dependencies from the IIO
in kernel interface.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/inkern.c         | 25 +------------------------
 include/linux/iio/consumer.h | 10 ----------
 include/linux/iio/iio.h      |  3 ---
 3 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index 95e015e88645..fab951546086 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -8,7 +8,6 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 
 #include <linux/iio/iio.h>
 #include <linux/iio/iio-opaque.h>
@@ -143,26 +142,6 @@ static int __fwnode_iio_simple_xlate(struct iio_dev *indio_dev,
 	return iiospec->args[0];
 }
 
-/*
- * Simple helper to copy fwnode_reference_args into of_phandle_args so we
- * can pass it to of_xlate(). Ultimate goal is to drop this together with
- * of_xlate().
- */
-static int __fwnode_to_of_xlate(struct iio_dev *indio_dev,
-				const struct fwnode_reference_args *iiospec)
-{
-	struct of_phandle_args of_args;
-	unsigned int i;
-
-	of_args.args_count = iiospec->nargs;
-	of_args.np = to_of_node(iiospec->fwnode);
-
-	for (i = 0; i < MAX_PHANDLE_ARGS; i++)
-		of_args.args[i] = i < iiospec->nargs ? iiospec->args[i] : 0;
-
-	return indio_dev->info->of_xlate(indio_dev, &of_args);
-}
-
 static int __fwnode_iio_channel_get(struct iio_channel *channel,
 				    struct fwnode_handle *fwnode, int index)
 {
@@ -185,9 +164,7 @@ static int __fwnode_iio_channel_get(struct iio_channel *channel,
 
 	indio_dev = dev_to_iio_dev(idev);
 	channel->indio_dev = indio_dev;
-	if (indio_dev->info->of_xlate)
-		index = __fwnode_to_of_xlate(indio_dev, &iiospec);
-	else if (indio_dev->info->fwnode_xlate)
+	if (indio_dev->info->fwnode_xlate)
 		index = indio_dev->info->fwnode_xlate(indio_dev, &iiospec);
 	else
 		index = __fwnode_iio_simple_xlate(indio_dev, &iiospec);
diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index 2adb1306da3e..6802596b017c 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -7,14 +7,12 @@
 #ifndef _IIO_INKERN_CONSUMER_H_
 #define _IIO_INKERN_CONSUMER_H_
 
-#include <linux/of.h>
 #include <linux/types.h>
 #include <linux/iio/types.h>
 
 struct iio_dev;
 struct iio_chan_spec;
 struct device;
-struct device_node;
 struct fwnode_handle;
 
 /**
@@ -129,14 +127,6 @@ struct iio_channel *devm_fwnode_iio_channel_get_by_name(struct device *dev,
 							struct fwnode_handle *fwnode,
 							const char *consumer_channel);
 
-static inline struct iio_channel
-*devm_of_iio_channel_get_by_name(struct device *dev, struct device_node *np,
-				 const char *consumer_channel)
-{
-	return devm_fwnode_iio_channel_get_by_name(dev, of_fwnode_handle(np),
-						   consumer_channel);
-}
-
 struct iio_cb_buffer;
 /**
  * iio_channel_get_all_cb() - register callback for triggered capture
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 494abb63406e..7093be1531c1 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -17,7 +17,6 @@
  * Currently assumes nano seconds.
  */
 
-struct of_phandle_args;
 struct fwnode_reference_args;
 
 enum iio_shared_by {
@@ -511,8 +510,6 @@ struct iio_info {
 	int (*debugfs_reg_access)(struct iio_dev *indio_dev,
 				  unsigned reg, unsigned writeval,
 				  unsigned *readval);
-	int (*of_xlate)(struct iio_dev *indio_dev,
-			const struct of_phandle_args *iiospec);
 	int (*fwnode_xlate)(struct iio_dev *indio_dev,
 			    const struct fwnode_reference_args *iiospec);
 	int (*hwfifo_set_watermark)(struct iio_dev *indio_dev, unsigned val);
-- 
2.37.1

