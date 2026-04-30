Return-Path: <linux-mips+bounces-14397-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHntLoE982kGywEAu9opvQ
	(envelope-from <linux-mips+bounces-14397-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 13:31:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4A4A22B5
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 13:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95983301649D
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1423D9DA0;
	Thu, 30 Apr 2026 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bTZ9VtEG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9GSHZ36"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAA52DF701
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548256; cv=none; b=JbgC73JcLjvhx/+R+En2EKuxc2C6ua/OEbmH1KjVY2L4YOrRVWpCTBcVDDgFg57ixcuFZcbmKPFdrS3/MkhoMfsiASE0IiGqLWOA+uGN4YlwT+Rha9vM535hDzbGxCj4Ags+v5nsxP08HRtv6RGF4bETHFUTLSneSW1IWIAHTUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548256; c=relaxed/simple;
	bh=g8qteu9u9qJChNKu0xLL2fC23X+b+4u8M1FnrGSQqSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZKS/86Btx9AmD1ythESIxyGHGo8/Q8AQGrz751crn/c+LL9Z7qRDa52CAiVc1iXZ2MApFQrc8m0YHRALxqg8KkaUsG7O/X9MhY4dcFyIK+02Zcm3pTtpoVj5vnviPiPGtyL1O7YQvoTwMUdkZugLJwGzr8GTMqmRO5dEFJffTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bTZ9VtEG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9GSHZ36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBLkjq256087
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UoL2cl/kOEgQBUaxtwRUUQVnKh3I9NYugGF
	gv/sN52k=; b=bTZ9VtEGQ9YXMWEG9pbTJvR1txqUgWRntUWP+Z9+18sMlsg8Emc
	Hsger1Jpc+qCAdb11qPSxZs8cbNSqnrKtPKtZvUyn0pweEfL0lahi4LN4WntkR1M
	EKOmpBe506G7qXcqtgdy3zhzAuL3Lz0kCay87ge6+Oq++zwtLLfDyNTU9vaB1qY4
	HPZSa+Sffzec93pAe3RW8GNJzr84WZ+kgROxQl63WTgajwLwA/nZSq5otEoadn7H
	ORp9Waxms5E+YYUsoPyCnjMACQH8ZfajfOS5e//nbaeK5R0IKGtVoo6Ek5L6ETwe
	OpFqljiSp93YBqjToF9GtIB7bE3agZzyGIQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71kxjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:24:14 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acafc224a8so17595546d6.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777548254; x=1778153054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoL2cl/kOEgQBUaxtwRUUQVnKh3I9NYugGFgv/sN52k=;
        b=T9GSHZ36qsEpwZcinI/n4vQq4JT487dLBVDg6gY0/h7/0AflAoGVqn2hTTRciWLE7H
         KRdPqSH85CQrkbtETffBX/i8i78NESt4vfst4Emhg/jrw7YmpgF3qvOMrHlcHKCRWVxi
         kTimfXL8EeJKHclul9v3uMPoSzWssZBuN+n0xkqgsp2iKkOfOjT+tOg2Ij3bvWav9yCd
         +nsW/fzvhLas9GdKGdjdQBKUgVM5CT9fleZgViR1yJG5r70BhzIQklO4BLPX7Y3Nci+a
         mc1PnCFgF18A6O73Ulh/tVpHFj89r1bRFylJ9eoUAHCcoUJPokWCl/XsCWfe3UWLC/cN
         3Pnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777548254; x=1778153054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoL2cl/kOEgQBUaxtwRUUQVnKh3I9NYugGFgv/sN52k=;
        b=B0XB0VGm+o4EKrx2sV48WDpnmb5kkMOcyj8a5seleKS5w2Tk4vboVfxlgOxiH2950e
         diu575llYQoXr6MjHQl2d/icpsXXb92EfSczYw1Wrmx38wHO7kwxTQyneKUS5JprV2/0
         6Mb0f1kc/4EiA/+vjbdZJS2DDGxAAkRCVV3uD9wwebH4M70BIuLYwY0ONecIZ+UwxCTH
         sjfpifKIFF8xEvqIyIcUAPYEE3CXHYf0wBjol9OI+xz64RIgmzRoEKqt73/oW3Hdt65m
         g7M4RzAzyFboZIojxgmdAnX0nQ0KCxezPoVyYQpyP5Job8rjDI0Z0Mtg9Wmy4xcvjLAc
         qZrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8e/pA3hnsz/4HCghEY+1233sL/VYvGOSGcJtAOa+XN63uhJtBocTyFlvjBLPVd/u6uGolbNd6BPpAS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7HAscv80jZ2LNoQksuS4oDrybSBSYn1+a8E+KL9jQKeecG+t
	NgCmcscrqQ2KTdDzb0UqJ05G/RYXK09JcpjsORc1wT1vc6I6MRN1hfZEwoGk3+W6MhLaCnqMA+9
	mAPe0xg22aDDeLLoHZxy+dpHr2VAyAt98OFBKedyGair7fRByj0JXlqNglx/6w0zM
X-Gm-Gg: AeBDieuyzvDBtCn+XqN/NpFGFa6pjN9MVy47XGMoezRFkM0bz8/TPPxtY1HIqK8BqPk
	VVzwlMEzSHs7zZJuLYMZv1C5mR5hWNpHV8xLR8G6rMIgDcZyLol/jNeypvoTsbzedy2iBMO9ehH
	4Tb198ejdrrTuUEF9xIZnx0IP/Zkaml06GUG03cqFdq24NwhoFFWQNgb3c2ayZC0lOrLf4nzMr/
	TiL2jI1pscS5CkieUD+uP2vvR4gaB06m1WN36ZbQq33zbQfIY5wgCWBsYEQZ7AjPH9ZK6wtBN09
	TnMfJ/X5OmrzXQwjN39NPoEvT/QeHriNn//HW9fFkD9H+tGIN8sTBQ9OJQ0hdoEInpQmk+3wIVJ
	Vbi9xANE5HtJYu3x9fa2M45ok+gl9VJ4cR4L5LrhOAQ/ESlx3enUTZZB3tX5z
X-Received: by 2002:a05:622a:1aa0:b0:50e:60a0:acb4 with SMTP id d75a77b69052e-5102adfffb4mr28182091cf.44.1777548253788;
        Thu, 30 Apr 2026 04:24:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:50e:60a0:acb4 with SMTP id d75a77b69052e-5102adfffb4mr28181701cf.44.1777548253209;
        Thu, 30 Apr 2026 04:24:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a666:f32c:e423:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm12951412f8f.27.2026.04.30.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:24:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] MIPS: RB532: serial: statify setup_serial_port()
Date: Thu, 30 Apr 2026 13:24:10 +0200
Message-ID: <20260430112410.65986-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bnKopUqZomjkov0r9yiSl5guxiXBbxBW
X-Proofpoint-ORIG-GUID: bnKopUqZomjkov0r9yiSl5guxiXBbxBW
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f33bde cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=YLUL8YGtBwKogN0Z59QA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExNSBTYWx0ZWRfX+6Hr/9kwDPf4
 15ies0NqCHpH6Ixs99P2/yyGHrjAz+f7rIHMrztdJzr9MFSDKMBfjI3LkGRtFDWoImVHVzx25bW
 j/3ktB82/wY2JVIzmQQ2N067cwAv6M7+ArzDSE99PbJmWEMyFBTcox7D1iFH59B81CRrH7J8IbH
 apmqLvG92KOuY2yuqmXIMlNjsfEisrzudlLiw11aZAovztHmUXedXdpykMgI3wxw0SWxSLPB2MF
 htdIhzp5W5dVmpj+uULb1vI6BSPFSYOBNd7axveyYloltL03nmBinbw8GtBniIsbqaz3mDbewox
 oWevg3x2xGXroXvXTAlQf/RaTNG9LlIKXq3MEGx7OdISsqXJt1jXD+px/nJqmxnLlIQ+0x5s1ot
 Yhco/7ac8oDnvEpcjTmvScFr81dUkbmakGpvprfM8FpAZuhlTH2GE9l8+yTRRdp+Wew9R/Qzsy+
 MjsRWik3mNGJfPtxglQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300115
X-Rspamd-Queue-Id: 68B4A4A22B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14397-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]

This function is not used outside of this compilation unit so make it
static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/rb532/serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/rb532/serial.c b/arch/mips/rb532/serial.c
index 70482540b3dbc..228eff07e5e85 100644
--- a/arch/mips/rb532/serial.c
+++ b/arch/mips/rb532/serial.c
@@ -45,7 +45,7 @@ static struct uart_port rb532_uart = {
 	.regshift = 2
 };
 
-int __init setup_serial_port(void)
+static int __init setup_serial_port(void)
 {
 	rb532_uart.uartclk = idt_cpu_freq;
 
-- 
2.47.3


