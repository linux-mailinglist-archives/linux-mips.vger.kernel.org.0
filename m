Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC61758098
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jul 2023 17:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233502AbjGRPQg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jul 2023 11:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjGRPQf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Jul 2023 11:16:35 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2021.outbound.protection.outlook.com [40.92.99.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C451726;
        Tue, 18 Jul 2023 08:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEwNYmfYcdK8eLbnUQsW1Vg2T+oNX+bdNU5gob6R3DHURnBoodDEMdf+FChuWzyyKQpAi659kvQv5YzehwEOhbF8d6ZqDMZPSMBtpZCK0NyiE2PWhd7DA9BGUA6HZGQ6W6XnEb00uFciiO87D2AVYQwL4Y+ralQpzfWfjGgQm5fw3zDGPqFDw7Q7EQRhd3mSqTuc/SpP8ZhG9oHrpfLkiArX76CBqMjNrjN4fYNjSQSUyiIOV6cxMc3Gy1If32r1uBJ6iJFdT6YsLpa3OK8WQMvBPQKQleuZET/UQwbzxsl9QLhMGPZmf58v0uDJOeHkR/KTZMcXvqZWA2N0JTrA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnLEhHQWScLLHZqoEPStaexmOu00uTjsXHaDjwDdVW0=;
 b=T3h0Bk4UYZW6G7fsdv6XTNubjhX37Z1MQntvAG+8PoQwwtE8r031FAjWYVPVLJcQ1Tuh/gP8xrRPeK8dMK0GTATnme+mKT3ZpJKE45mTzpOivPhrZOkT8PcZYtRs6wGkE/rVcqm7ywo2yjuT4n5fhHO4I9WMP8tYT77NAmxIHc3fDn3YtXUZaRyAJvXRAot81Yt7l9PtA014glygmBq19UWPmCssFYgW+MBamPPgmdIljPDPK0F+q79SaaM7n6wDSzMV8F2noTqeGDoLHRmppY/C0busY5PC6u1IEoOEM54xVtzaa7Tv0FOK6nDQMnHK/XWwoe6v5SEW+JNLxFvDaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnLEhHQWScLLHZqoEPStaexmOu00uTjsXHaDjwDdVW0=;
 b=udx0Uprg4zHh6RYQOh8nztpTZBbtoEChRB1LazWfUVN6NsXZRuUmAGexVk1HP0/H36asEV/p64bLFEb1z+VlTj/r2DMTu5gM2Fvs2VGE6ASRVsPb4i4JCGNzlaoejY0i2qPh9emjGbOIccrlVfDuAdoWu8a1H5ih1lSDrz6N1QoMBf7cHyEAe1oetAGm/v6s33noVbS7W8LMGR95Xl8x5fjl+DPyoncnX8Ao3AEiec9abcCoSxfT1HAEMg1/QWBowhed1gXo8PPzM9voevPDgf6S7TPi7RShzcEh4zNm1t+ep7kuMQCiavMPJT+tEEB52eNwHHqFronfOTohj77RCg==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by OS3P286MB2215.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:19f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Tue, 18 Jul
 2023 15:16:10 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:16:09 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     linux-gpio@vger.kernel.org
Cc:     =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] pinctrl: mtmips: do not log when repeating the same pinctrl request
Date:   Tue, 18 Jul 2023 23:13:46 +0800
Message-ID: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [b4oWDF+nRk2gc1a5ICE0Szv/OHSKiDA0Ni0AFMdORW4=]
X-ClientProxiedBy: TYCPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:4::18) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20230718151346.2512-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|OS3P286MB2215:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ffe219-22da-43af-eea4-08db87a1ea64
X-MS-Exchange-SLBlob-MailProps: 9IecXKUgicDvYya0XF0tkOtrlBp/mHl3nDh0vrcNBF+mdsNI54ktcXt8VMBdbQOGC/ZQTfjEWeolhuJ/nwc1u3e2sBrSt4wccnLHNLi+nd//p5eTp0QqJJFF3veRypNPRe3qGVN49CHzHtYnTeUtYLpb31I7Pt4js6/j6uJ27dKr99AOCSGYh1fB6giJM39nIm0SSdtK0an1DqHKZD9cSSCVS3yb5KwkNyhVwep0J8QcQIR7DGKbzmjpq0I1FgudoeDhlwuyKn55kD/5aqSwTLJsXq8Y2zNt9gT3/gB0cJ7zHT8L5+hWN9EDSXdBUKUXzlKuKdz5wQ81TL8yv8L3p6bW5iwp1HRRy/s1mFD8ZrJJK9XWmCwO7lRX5YM0qPEoAepdlYWRXgQoQI5lYIIBowBBTtU2fGCM9cYaiQ+6ETQv2WGuVIEYfRzdQBUT05uy47E1p0dTPptWcf9AYuAVVV/niKYoXaqcXO7s2bXtSxG+xFJFm7X8MHBTNa1yfU42fAhSmINxyszw++sBJtF516hfIwifPnSW3mGKuaeTSvjU+8rQMobjlg+xK9GmLL4g8xrySwrNEDCRANJlisiy8RVbh5WpbGZBi5Wlc0DoSvcY0JTaz5qAYILIrPts5StG86/vxTXlmvxCnTs3ubAtgzWfAN0PYhZfgwMAwSb4KZzxKoKe/L1wAGJyIEhGkta9dJ1G9WOUtIYtjgylWZuWw7h++GS9c4Ti9TrpuqxdAaeKKEU2yTsSyA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLJLlIZ9LuLH2u5Jwnfe7Nusuu2iPi5krLSsWW1ZBcsC7pq8jnAqdehnVokDtxwIH+am5D6rAuNUd4IdSRkXWwxpbSH/cmZHgRARkelNvv/sskeRwCgzN17TIAhbAmNc7UAkcd1p6MMnASZBr0jQkHBcssAqdgSXkOe7eyIg95+K3KvZCWqGmwmFaks+WwNw9Opj7iwCx0qH47yejWEFR1upqp8QHopR3kw8RLAChycqbOpBerNKBP88NwnZu2gDslhBMKRhhDOYjCJ0HwNfZKrhJger4KUKwdZB7g+l9PCaxRzqfgXVHyHalLClmcA58LOx9Hlxnk1FMQxyaZDegiRysB4BTPhOVxt7xf2+YJvtsZRE9ud8cYWPyf7sq2TWe+AqLBdKud5hB0jLJdZz41NzhQ1nk1ZGPOJbZmjKajvwUTBpSAY419REZTIl+kLJUW8km1f/lUnOBLc/uC/d4iAer3KA+4XRZsxmIUJKXDUT56JnOTMjZr96S40Ko+FEVhg1BgL14BFBeXRvxVrrv8jfFdnFwcoPLE7HDYFNZbEscdChfsqtwlBL1zV5ckVt26ikin+KJtbA6g53AUa5Ur+r3l7M0jYYyJiv8WhFEKukSpG3xhKj4trGf7F9fc/2
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aPBQSwZRDPEziWnwJKcVrzESdKMmbAIGPZHDATj0KlzPbaDhsP78mejpBKqr?=
 =?us-ascii?Q?fG+jgln/rii3dRnV5d73OnrQfsGJviG353lnSHnXAqQ7EK8IMakFyb3i+qNK?=
 =?us-ascii?Q?Y+z1asHLnyS874X0lT8JylaeW0jVDsgS/4u144WbEUaOTURVIR0V6C+A8BCY?=
 =?us-ascii?Q?pKFykP9WEGwK1CFR+E5rT737tD8MMelxR+jgGPl8IkaJc4nOFzs3KiLZhf5H?=
 =?us-ascii?Q?6JPTRvx0Hte+IVMRgLU7YnvNJtUzPsHUI3lBS7/luJkw5+Kb5eYnyr8HNUdG?=
 =?us-ascii?Q?oEzBCRwb2B4n9BKf42hHNaFobpdmHctm6adEF/RfImTugNyopT7xV5LjpPUS?=
 =?us-ascii?Q?aDtKMnsuDYKcvVD+KNfIqVp03zHgWgJOwW2LPz4uYNWhv5CNEXIgWD7YIS+1?=
 =?us-ascii?Q?BJRS5FSyiJoVLfthAartCN52FI54ssvk73SUOp51Um8vPx/5yxwy0GL2OVPm?=
 =?us-ascii?Q?COA5+EyVJdDyOYyOK5wj2QqFrHIKLNWA0u08gEZEH/AnIC6DuDHe+eo2RpOj?=
 =?us-ascii?Q?1KvHXD5JZ5aKTZRWu2cth4ofq8jO5t3MmSo/z2nEpzHutvnJ6TmRfDjYW5jX?=
 =?us-ascii?Q?bnBxU5iKNqOkd5tjzlHH07khrXwzYD9SrO6sdkwLxUuCixajvll5RpsZ7GZZ?=
 =?us-ascii?Q?RhyIPOPScmg59Tdc28tf+mHvhrRlJMRL+zI28shTOp4eV7zggDqcz2osgbyd?=
 =?us-ascii?Q?onqbEnsxOSaG7LxqSo3aIShTEOjP8CzP+04nYo5uIJ5VM43XOweIdceplPNE?=
 =?us-ascii?Q?XMO/Qx3zHDHJLfJ5EDWg5TFAjed3V60uEQpdtXUB8S2KzNPUSGo/v991JLFG?=
 =?us-ascii?Q?0GC893FaIiQS4kbmFt+Xvzh2SEnnpJW/jQk+1kDGhcndBtCJ0G1iyvpHGx1F?=
 =?us-ascii?Q?YcRB0qVsv+6jI0kvpPHw23pr1etPYLHNrtS3MWJxqs8bgOBfEuwKT+/8bM7c?=
 =?us-ascii?Q?p9ZQDjbjgpRWokS2iQ19FnIMW/HjyzeYnIkYTLP5lMq3Q2Y3YEw+4Z9LgJbP?=
 =?us-ascii?Q?rrt9MQoeMPV9YxJ5b+bUgKnQFxVtW3nrDM31ET5YYsV/pjNKo/7aEd2Iq0PO?=
 =?us-ascii?Q?SEe2DeZuAzePezNflYSaLhRTF8lVEyZnXgC6QgPhXxaTweK+SnOR5642gAgr?=
 =?us-ascii?Q?2v4rjZ4gVowLVKdhlD9IbQXEnf303XrwVZIy+PaywT5YLhCqcbl1Cj0n5AKL?=
 =?us-ascii?Q?/GszseycEB2tbqT8aDqKLvWC3KD2DqYacsm69d4ESD+EDVi63sfFyQIVQ9U?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ffe219-22da-43af-eea4-08db87a1ea64
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:16:09.9134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2215
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sometimes when driver fails to probe a device, the kernel will retry
it later. However, this will result in duplicate requests for the
same pinctrl configuration. In this case, we should not throw error
logs. This patch adds extra check for the pin group function. Now the
pinctrl driver only prints error log when attempting to configure the
same group as different functions.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtmips.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
index efd77b6c5..8f5493220 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
@@ -125,8 +125,9 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
 
 	/* dont allow double use */
 	if (p->groups[group].enabled) {
-		dev_err(p->dev, "%s is already enabled\n",
-			p->groups[group].name);
+		if (!p->func[func]->enabled)
+			dev_err(p->dev, "%s is already enabled\n",
+				p->groups[group].name);
 		return 0;
 	}
 
-- 
2.30.2

