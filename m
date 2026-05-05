Return-Path: <linux-mips+bounces-14452-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JizIOWy+Wld/AIAu9opvQ
	(envelope-from <linux-mips+bounces-14452-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:41 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9B4C91D1
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63A5830182C8
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96FB3D171B;
	Tue,  5 May 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zda2Fe+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRE5ZmVR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07C3D9041
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971910; cv=none; b=Mrv6jlHhh/2CRChD+gkJoLhNw5xXcbOR2Pka9zNoIcWD5N/yA6Aq1hA6dmBxHk/jeTqq28+8JCqBsnsIE5SdUCzvBo+2LUaz68h4Uga2ReUVdZuutW8tiB5vvC2HeqlmKGIXBU+UUwrMuwwqrGb4IAp+tg4AE9ZYMwKdeu2P1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971910; c=relaxed/simple;
	bh=QeVcBC0p2efLvnkxs6LPE7MK3Mrj22TPDVPpQxugJ68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CesS5dED4BLmE2wSPmQmMMTjrr1E66Pz04ZpRWoCP4wxYLdqGQRoCs3pQu75Kya8anhl24E2nNMqR9EtX6CefWstXARqg7/o8wOmoboUjtp3k2iMWxJ1aqBhcAMSo/cR54rKbJ9z3vA5d/dRyurgjIERhqNhKP4b1e8D3Eo0ho8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zda2Fe+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRE5ZmVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64585e6W1187203
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	INuFIlg1Iic+E+tZYGrpzz+KhjpxnOVmhz7h22MxerM=; b=Zda2Fe+euQYq4XSs
	dGVfMLjszvNzWaTCr5tofteDbNuZwLxsCK8XeEugYwQEvk1DCGri4zmY7jzquXbM
	ZzMLHsI9oY1I9GMkYufPFQ5Kr0Y2BCWHZKTwmZTTF7iGg0S0UmX5UXUPbUSWAL+E
	VilR/W0lFTQpan4D5sfyldDX65er5XlM+2ElDwXK5qvy9PYOfBwvx9Uevg31elkh
	77FU4axa1O1V+6777fh+U/rX2RRGkwr6co4rGzBGJK7Cl1HnqDrFOzGPc6NW2/zm
	wiXCWr7KoKFvY+nzGqN98a5LEqKBC4OIqoh65icDoWaacmvNMkTmpZ8RajHmRIIq
	8s8UTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgbhvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50f13da9684so62119351cf.3
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971907; x=1778576707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=INuFIlg1Iic+E+tZYGrpzz+KhjpxnOVmhz7h22MxerM=;
        b=fRE5ZmVRgaq39mE6nVjjDEXaIn4oRLiqJmRME6IYgmpWZo5Hq+5330JDVA8n0nHYy4
         gpD7nr0YlbKuMgBmMvMowGZYU8EzKp5rtQFvRHQ+mSvPqZb1McNhRkpsg7Fq03cn96xg
         MnEASJW/0+TMWSPspKZet/1EF9RVw4f29J/KXyxx42a3UHXtkG86rQ3SMsr/NXHseY9p
         2fjNo73/ILcqwX0v1YfPSnE4eVmhFBGx3qO2ByhSRiubrQrddxPCHclFp/t3pPhe/RRG
         i0f15SMgbk8Vgee3ugmRVLhZLog05l7xqw+w3WOTUnZ49wEvpFoxQrG5VxEinEZgFQf2
         G7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971907; x=1778576707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=INuFIlg1Iic+E+tZYGrpzz+KhjpxnOVmhz7h22MxerM=;
        b=ZJ61GNmS20gdO5l/pqMzuwy4YC5h/9wNoUWObL9nZt3SbSayQC0U0CHOgewFR5nUiC
         zk45ANG+59x2uAWkhK6Kz0HwAxad09L2SiYN7rt+nm2ua+9XRBm0R1BdwptjpMW++WgB
         ydcU5debW2WNGzMPPv9avkQh8/5sctxdH/zMbAP2rOppifVEy+9AmFDp5+4JJpdOb3iQ
         R4rhgc2Cxsrby/At1xtEmu/X+CHJ7JDKnPA6TTVutk6sWdu4PifUfaadiIL3YrrZ7Knu
         XqJ8nQTPWHmx7l+cO2XEfg3zeyKqIHrkFuW2tS7SqPGMsWUzwN0dAry7eOoIYeu9gJaX
         cCCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/J2LwBLTCqAlV5cGZwACI3L61VjOSN+CE8SHAhHMjVXsVnb5mPsDqmzU155+JOed8modBNSZWDah7l@vger.kernel.org
X-Gm-Message-State: AOJu0YzBYa2JNJDWyVwwi9Dlersv4DSv7o7tOhWlFZTAJ/grUOC0GEAy
	AfL2vs4WLMcC4ncbn44Qx3oZ+SfrkiemKH7urZ1KS0oXpXJOpKB1tgG93f7onqmaaLDc5M2yFZ9
	0Leb0hznYKDAGSUqEyUqoPn048VB2/BeDP+8y8PZDuXtiVyMcxLowci0tPYpMx4sE
X-Gm-Gg: AeBDiesw07BwJosNn9xE+DqTUp+lgz7drOwlZ9GOCeWt0Cv+PIsKbGjdcGU1mbubMIa
	qqMzxGWFTy958NU+c2+spWKbypdTF17r+G+iEZiGglCJGGQCjk76ZfLuinpgaosk255NTU9JY3G
	z0T/l3DqDvTzKtO1aaDNlDuQ2Euh5xZ+qp/XC3C5U0Uj1rVBqjqbyhJdM8dMABXyUcZnnhiLwfO
	t9qeBpt941UfE0FFaGUrGLHBZdmJezBe3UcnGa/pjlMPLrrIs0428XNf3zjKEIuZcd+OwiGc0X0
	LeEJxGJp5euIqUVG1H/n+XKdseCMq3hH4zsTgow/gjoxEvUmY23JX5IqUvrToSGvqHfzv5bWdY7
	JJ7Tw759jjygoPSdTANWP7WWBnDsbZ60EPKfm40qFZtJMdBVKN2PKa7VlyCjL1w==
X-Received: by 2002:ac8:7f8b:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-5104be8b1d3mr189052021cf.20.1777971907479;
        Tue, 05 May 2026 02:05:07 -0700 (PDT)
X-Received: by 2002:ac8:7f8b:0:b0:50d:9e36:f961 with SMTP id d75a77b69052e-5104be8b1d3mr189051711cf.20.1777971906975;
        Tue, 05 May 2026 02:05:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:05:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 05 May 2026 11:04:45 +0200
Subject: [PATCH v2 5/6] MIPS: alchemy: gpr: switch to static device
 properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-gpio-swnode-alchemy-v2-5-cb208afc5b56@oss.qualcomm.com>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5546;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w2r1Ehd/+Dmr6x3jh5Mz6f43dEUaOznkob9K5/kq9ng=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bK4U3rm3m5FqVXrbJsEDNAj3X+3UzRd18+9Y
 V/WSSRRTJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmyuAAKCRAFnS7L/zaE
 w7OdD/9ME17bWjoc6s7vAxKNy9gdNJyvPkislvkbGLqJ3G5ADEbEl+n8MyjvIr4Vu4iExAnCWRJ
 /QNYlHYEXiy0x5nwvwB+jzd33dJwmaIZUKNQttvBPlyEDBE/m6YyAVhSNqp3XpA010qoPDxFLJB
 /FJj7m8pUNSC8T97KeTF+TQHWJO1Z5XtKQPr6RQ2S2eZysAyhJPlYQK+HEveCGzm2PQwUXMYbW5
 uSggF8WgaC3z6RihNt99JvT5fITyGEkGl0+E6kPaHSsLIrIEN/rG4yf6yaesNdWaP3x0H2vnbiL
 R0qE1piyqSEsqAalQs6nHKmiBvPsXcJ3H0D9SPgMhqxrgCpMiyr1ycb/VCLw4ltO5zSZEqnkeIC
 n5VIMZovgro8txU1G+gTqrgQdB0h1znmcJRMowR67JurpApALfaT53nnw+IicEIC3KryHNvqzzY
 QGL008EGGQ1BXjy6USw01CvUSZnbnN+nbGsXtk0fHHo/6u4MkbC8LaiDQo81RXVvcs4qiywnzN5
 fGBN43a4/0+R3KkuKD6EAhdkx4bmbaJhtIW7T3YU3maVfFpLISYy34C1HDsO5ZDBs5nltPHoJdF
 xhXSsuJpT00Q9iH6+uHp9b+osbeezACb5Wnu1Wn4wuzmhpUelcNxT254c+LaHr7O5oJoYV/4DFH
 qm9NExz1VNSkKtw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: weQkDTHQ4GmyUGnVtQbUTjwUL6SnAXJM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX9AsVzURX+SJ2
 rGyBJ0zZo4tNCyyaIXkNzDePisgfb1nQaKqcduRPAMkLqp1RvxoY5SSQ1uSVOT9o6bdpHY08kzx
 q7JSi3hnI6pQfQ3KgVWpm/8FSS5vFrJg9Wq62jgkHdB8fILzJ/ClodrvMMR9h+OO/qbGnfRaq5G
 JYrV87xyOw1kokjkHZyw54ofYoyvMr1s46sGcWzm8Cicm8MTfdHx16o8lmRNjT0AzNGNuQHJnWn
 zxcGuddF5DGEB2CShrfvie6FHHg2jIb82uhfMhHOvIY2Y5+mkhbVLYHzGH1i14Pw54J6oVUIHR+
 kxJi6ZcvlHvEtf0yAG4zsuoo7IV/LF9PTWo6uRmG9J67svjNKRN2p+Sm80NITuV5ecdnWCIx8Tz
 J59+tydRNke8Ub/1unkUBMAlQwCeuJG3s7SFRlW0W3D7THYILMqgCEuTj/olyDAiCM+dunryBgc
 JUkd1Ut3vW67M0hpR8A==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9b2c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=G2kbB0RmGtoI0qVf8F8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: weQkDTHQ4GmyUGnVtQbUTjwUL6SnAXJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050083
X-Rspamd-Queue-Id: 37C9B4C91D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14452-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Convert I2C-gpio device and GPIO-connected LEDs on GPR board to software
nodes/properties, so that support for platform data can be removed from
gpio-leds driver (which will rely purely on generic device properties
for configuration).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[Bartosz: use platform_device_info::swnode]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/board-gpr.c | 122 ++++++++++++++++++++++++------------------
 1 file changed, 71 insertions(+), 51 deletions(-)

diff --git a/arch/mips/alchemy/board-gpr.c b/arch/mips/alchemy/board-gpr.c
index f587c40b6d00a9ce5c25520f31e2b2ca60c80919..b7e57e3152009eb979307f924e4217a5911fb3da 100644
--- a/arch/mips/alchemy/board-gpr.c
+++ b/arch/mips/alchemy/board-gpr.c
@@ -13,11 +13,11 @@
 #include <linux/pm.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/physmap.h>
-#include <linux/leds.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/i2c-gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/property.h>
 #include <asm/bootinfo.h>
 #include <asm/idle.h>
 #include <asm/reboot.h>
@@ -161,66 +161,87 @@ static struct platform_device gpr_mtd_device = {
 /*
  * LEDs
  */
-static const struct gpio_led gpr_gpio_leds[] = {
-	{	/* green */
-		.name			= "gpr:green",
-		.gpio			= 4,
-		.active_low		= 1,
+static const struct software_node gpr_gpio_leds_node = {
+	.name = "gpr-leds",
+};
+
+static const struct software_node gpr_green_led_node = {
+	.name = "gpr:green",
+	.parent = &gpr_gpio_leds_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios",
+				    &alchemy_gpio1_node, 4, GPIO_ACTIVE_LOW),
+		{ }
 	},
-	{	/* red */
-		.name			= "gpr:red",
-		.gpio			= 5,
-		.active_low		= 1,
-	}
 };
 
-static struct gpio_led_platform_data gpr_led_data = {
-	.num_leds = ARRAY_SIZE(gpr_gpio_leds),
-	.leds = gpr_gpio_leds,
+static const struct software_node gpr_red_led_node = {
+	.name = "gpr:red",
+	.parent = &gpr_gpio_leds_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios",
+				    &alchemy_gpio1_node, 5, GPIO_ACTIVE_LOW),
+		{ }
+	},
 };
 
-static struct platform_device gpr_led_devices = {
-	.name = "leds-gpio",
-	.id = -1,
-	.dev = {
-		.platform_data = &gpr_led_data,
-	}
+static const struct software_node * const gpr_gpio_leds_swnodes[] __initconst = {
+	&gpr_gpio_leds_node,
+	&gpr_green_led_node,
+	&gpr_red_led_node,
+	NULL
 };
 
+static void __init gpr_leds_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(gpr_gpio_leds_swnodes);
+	if (err) {
+		pr_err("failed to register LED software nodes: %d\n", err);
+		return;
+	}
+
+	pd = platform_device_register_full(&(struct platform_device_info){
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+		.swnode	= &gpr_gpio_leds_node,
+	});
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create LED device: %d\n", err);
+}
+
 /*
  * I2C
  */
-static struct gpiod_lookup_table gpr_i2c_gpiod_table = {
-	.dev_id = "i2c-gpio",
-	.table = {
-		/*
-		 * This should be on "GPIO2" which has base at 200 so
-		 * the global numbers 209 and 210 should correspond to
-		 * local offsets 9 and 10.
-		 */
-		GPIO_LOOKUP_IDX("alchemy-gpio2", 9, NULL, 0,
-				GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("alchemy-gpio2", 10, NULL, 1,
-				GPIO_ACTIVE_HIGH),
-	},
+static const struct property_entry gpr_i2c_props[] __initconst = {
+	PROPERTY_ENTRY_GPIO("sda-gpios", &alchemy_gpio2_node, 9, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("scl-gpios", &alchemy_gpio2_node, 10, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_U32("i2c-gpio,delay-us", 2),	/* ~100 kHz */
+	PROPERTY_ENTRY_U32("i2c-gpio,timeout-ms", 1000),
+	PROPERTY_ENTRY_BOOL("i2c-gpio,sda-open-drain"),
+	PROPERTY_ENTRY_BOOL("i2c-gpio,scl-open-drain"),
+	{ }
 };
 
-static struct i2c_gpio_platform_data gpr_i2c_data = {
-	/*
-	 * The open drain mode is hardwired somewhere or an electrical
-	 * property of the alchemy GPIO controller.
-	 */
-	.sda_is_open_drain	= 1,
-	.scl_is_open_drain	= 1,
-	.udelay			= 2,		/* ~100 kHz */
-	.timeout		= HZ,
+static const struct platform_device_info gpr_i2c_pdev_info __initconst = {
+	.name		= "i2c-gpio",
+	.id		= PLATFORM_DEVID_NONE,
+	.properties	= gpr_i2c_props,
 };
 
-static struct platform_device gpr_i2c_device = {
-	.name			= "i2c-gpio",
-	.id			= -1,
-	.dev.platform_data	= &gpr_i2c_data,
-};
+static void __init gpr_i2c_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&gpr_i2c_pdev_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create I2C device: %d\n", err);
+}
 
 static struct i2c_board_info gpr_i2c_info[] __initdata = {
 	{
@@ -270,8 +291,6 @@ static struct platform_device gpr_pci_host_dev = {
 static struct platform_device *gpr_devices[] __initdata = {
 	&gpr_wdt_device,
 	&gpr_mtd_device,
-	&gpr_i2c_device,
-	&gpr_led_devices,
 };
 
 static int __init gpr_pci_init(void)
@@ -284,8 +303,9 @@ arch_initcall(gpr_pci_init);
 
 static int __init gpr_dev_init(void)
 {
-	gpiod_add_lookup_table(&gpr_i2c_gpiod_table);
 	i2c_register_board_info(0, gpr_i2c_info, ARRAY_SIZE(gpr_i2c_info));
+	gpr_i2c_init();
+	gpr_leds_init();
 
 	return platform_add_devices(gpr_devices, ARRAY_SIZE(gpr_devices));
 }

-- 
2.47.3


