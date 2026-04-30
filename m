Return-Path: <linux-mips+bounces-14396-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBYsA1k982kGywEAu9opvQ
	(envelope-from <linux-mips+bounces-14396-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 13:30:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC94A2289
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 13:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EFE73013AA4
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2026 11:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1545A3D6CDE;
	Thu, 30 Apr 2026 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwO9SHO4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cTO+8HHw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34D347FD1
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777548204; cv=none; b=FGcT2hht/0y3/y8aAmlr9GidbGnvg/d9EXAgjLo77c9wV8VYpqOzw00Ni9OcMIP0nQNEpk6PmUNSyglOSKt1l7tDgXE5bu+gpnEg9gDfxPUcpeYwrR77o80kCM5KOa9nyUD6aqZUHZZXwXBLmMe2KfUhHnsAnlk/qhBlSPkuHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777548204; c=relaxed/simple;
	bh=UK4kHI52Ahr1N/314eUf58bgKhMEOKFijjmsy7y/GQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OlECtWFXagwBTet2hpFuZYWRTY0l814DaZKtAis937OGNk2Yb6jGoPch2PjmZ/qzDtCCLD8cr3pwaTjkLLN7tKYiT3NUGKDulovhTOf2Vz7boVDz1JfiV85MX1bMbocNOj5Kt29a/0gkgCEGovlCw04YTspcQmeqIWi4iyIQ0/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwO9SHO4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cTO+8HHw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6T51n2533953
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HCi/JzzWxPm60HCa/51RxA
	295FFH8CbF+QIszze7OoU=; b=CwO9SHO4v2bWC1BNJbMy3Xz0B4bTxlFpZ5v6QG
	7HOxKDF03tj+LTlacLS/ju/7jFzTeteHqV4c488SCyJZ1eGaRbD0dli5Mgj0gqzW
	NMN+MThQjCZYnkziQ7hihpy5stN/fX8ISF6rWyyo8o+oReaSBaEnqhOfDnw3U1U4
	pD0xJFo+XlSMGpF1tTS2P7SO6IzyMfT/YOVPgBEsygih42NqzwvJaudnvvWSjISH
	Hc15bKmkU0ckKDNM3BW1YvJQz1y4ksjbwXbZKXQAppGm2wM++u+uH34lySiU2ab4
	aWLi6Cf5IGpR5V9EEC+jNSG+jzYurIDBVh7G7t6xn5bB/L/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dupe93f6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 11:23:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so3844461cf.3
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2026 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777548201; x=1778153001; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HCi/JzzWxPm60HCa/51RxA295FFH8CbF+QIszze7OoU=;
        b=cTO+8HHwbntAx4NcFqlEvWjsjX0idQp6c433aw3e/qoBXtITfyhzfwQoCFOBcCb3LQ
         AgyeOxTjihlMgGwZhhU72o+wTi+mrd/M5OZabPi/usicjmmkh/fUaU4A6CXHbgMhrul7
         ZETS8KiiXm3ho4vV+cfo5XfSATx9vJW8+Pq8NtUrO11UN7VYL4l94ac6OnPQEvtQ9FYv
         nbwQtGu9Bllj4EHxJvB4jy6TXZdQgWYjOBR/arbAb+/SGUnrk4QWRh0Zqlqdsp5r0UvO
         fIgw3kWlq57qkmCIihvUhQr5HsKiWd1xmQDjAnn3nLiYJnN4+1331YkyEpA19aH/vZqo
         dMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777548201; x=1778153001;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCi/JzzWxPm60HCa/51RxA295FFH8CbF+QIszze7OoU=;
        b=CgnEwdA2xo3WilFWl9ClpkS63RpfF+dcnPCZXkSTNVNjDbWts6RSRDtCDvad/obU2s
         gJ4bccZkPmHjo4eyWQO4Imhot1K3vLqc5Gfmy2u5f0zCinaflr7fSEZUolf1guBLCH6u
         xReZbx5d7PrsYo6Wk2LH2LOugANWSo4gJn+avNJoNrrhVrWO5eH0zYulq5CToB22YwkY
         ZKMU5TnB2AeCoDlB8hajsz7nvydLF2UvIhIHDw6hRoP94se7d3sJ8dbrmViLOlRVQ3WF
         jkMPZp3hzh27lKGZ7Pnz4q5pgeoa12ddZ1vlEXBR5TY5MDek3q7gF6aIApMXG2G4tNLK
         aKng==
X-Forwarded-Encrypted: i=1; AFNElJ8wU4iEnLeO1QAbzS1eqP5hJXjgaH/lhe6RXzH4UwIteSm6EXNeevWS2R187FvksU/4c71SHhmGbnXE@vger.kernel.org
X-Gm-Message-State: AOJu0YymIif4+FMJUs9hyT2WbwYqVt7j7JRiPu9UwYUGxcP1SBbe0YEb
	5/GngEYyNgkOs7+TP8+Qlu1Tz4OgIjCOx5+38wyKVQx3jlZjxKByJnkxSsQzlkHegcuf7mI6caZ
	hQADqc0GliiP2DOVfG6fSa/q7VWUFk5o794tv8ZfODR1Rp5OrVHNuwe3zc/LXah21
X-Gm-Gg: AeBDietfhiPDivEkIScs7HogXXJM8wQnSc6WfbOkLgl1ClMbjp+9k9nBkc22Sv2pjIU
	CvfgShPB4zbL1nepy/h8EdtbhGJdkVAVvopFjwmU1vr1v7qOYLGbDD34n4wwJSIiNZfYhwTqaKK
	rWFzIVfodEPi9CWjmHo+2NfHfkaeXUQ9cmiOT8oZEPfGEMo6Jy9AzpD21RIKLyhi4h29tSxjTAC
	17STRzEA3Owur7bcvkBPoEUVmSaMitIEfAlr/RAXBhodEB0AbRGRG11ZOOcP7CgPcLqs5VKWMT8
	TwljftrsglkNZ8Xltl2mFd7NaJNUa/Xb+t3Z847/9oMwmAYC9u+cffXSCcEbg9kqRQm3CbPeOLt
	UkT6lMJcDa3uxQCfC/+JPhpuiXQCNpjqE/1QWCvZh3BfpSps4Z53kovkw4RZAww==
X-Received: by 2002:ac8:7f42:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5102aaeb0d6mr34105651cf.11.1777548200637;
        Thu, 30 Apr 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5102aaeb0d6mr34105001cf.11.1777548200065;
        Thu, 30 Apr 2026 04:23:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a666:f32c:e423:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca6451sm12953997f8f.36.2026.04.30.04.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 04:23:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 13:23:13 +0200
Subject: [PATCH] MIPS: RB532: attach the software node to its target GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-mips-rb532-gpio-v1-1-845a0c6206a5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKA782kC/x3MTQqAIBBA4avIrBvwp6S6SrTImmoWqShEEN49a
 fkt3nshU2LKMIoXEt2cOfgK1QhYz8UfhLxVg5baytZIvDhmTK4zGo/IAa1yZui1a2mzUKuYaOf
 nP05zKR8G3+z8YQAAAA==
X-Change-ID: 20260430-mips-rb532-gpio-61b3982b4ed6
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4969;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UK4kHI52Ahr1N/314eUf58bgKhMEOKFijjmsy7y/GQM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8zuiqSs3MAsw+pYepevWYuhTdxrmxVcoWHZ7k
 7pltyviuOmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafM7ogAKCRAFnS7L/zaE
 w5X2D/98ov5whvRIdvI5JEydfbAGvsk6egITFW1xbR+TARUsQ7PfghxxUepmwpOvQDUsDhYO9i1
 k/rhDtjoW14MKr5PXSjeLloQpRx9zb/eWzdPCWnhwndFf0HJw8B04ajWJc/NTuWMy7cXsuPQ2ln
 LYvwzHUQgJ2ojO7qf14XNS+W9Tx8IRi/ydQMzUczR32DWGp5Sk6vP68W048M1MR8cav5p0qhzoZ
 b4rIRwceADS9Rc1wqPHT1urt9giNA5gJqe5Yvn/s8peOEv/HXfUNNQQ0J0SmOdNIzq9a84zHisU
 hztgpNh5XNkxD2Rz0km4244UmsMFtjXqGcn7eOWUA2HFp624tUhPKajOIYLNNqK9ORlJp02MMWG
 zXoxWQkTvlrB2Tlp8vgZiHSxej0iIgVtDxqvzAzuDC7psCmKagTX4+95ai1wN/5Jm/76KK5RK1/
 V0+1VAk/aocek6UPUbclmzPSSuBRzDq7O2ChldhoF3/CyNFwn7SWJQqnwyPX+7mzo5c20/DIKM3
 doM7r/FtzbEyYyShveE0xkHr7HASZRM8KKcKY4Cy+CKgXwAP6SjIZtZhNHxVGK7FSTnmBdq8aX4
 kriUuRFDcsBHg6Kw4aGvxm8fNFp39pGtqF98xUvAMlbelIddnKEU42w9JrsX90uaNxR7QXqG+2K
 KquIIyTvvWRd0zQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OWCXeDMQAk2poR1ANjp66yIhM_Ped71Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDExNSBTYWx0ZWRfX5dvGCC5JLUpo
 sLbgIgeTNrOWRgciN4J8DLIXJyDFnhG9mnHnwW5zLHfIh8SiPLyn5miR1ClQ/EjEtSHTklUo05g
 3q1jwOhsvOkVDJqoufvaXzgxnOZ6DYKe7LMfvE2ZmBfHTZzyL7auAkDeH7iZNkUcBJyd6kIk1na
 aY4BJTrSZTGJJjOhEB5c+E2gc+ib3YZXZofIFJsXqyS1MycPJND4D1hBhSSbJxGRY1XuYSdQTAP
 8RjfOsjaba0IFHcChEypTb0duXjl1r/uOGcluzWTRm9c/bB79sDEsf5UvTSyQlQ2pbFZ+eS25ZQ
 J+ZZSz+UWzp7mhQp36Fz1REv5QNBmdy5NcGzyUUi3cVhAwRuQcMu4eimh80qhHAbBxwUj7/8RmP
 fKW6sF0P1zDBOxFMUACJ1RuejDiNfIlFZEcaBnvSyjhwHfTnKAv73LKTUt17e26qaGRUjGrNeOJ
 FonQx2HkFIx6CtiqOVQ==
X-Proofpoint-ORIG-GUID: OWCXeDMQAk2poR1ANjp66yIhM_Ped71Y
X-Authority-Analysis: v=2.4 cv=PvmjqQM3 c=1 sm=1 tr=0 ts=69f33ba9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=1dDQIzMfk7xBWFt78D8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300115
X-Rspamd-Queue-Id: A5BC94A2289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-14396-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]

GPIOLIB wants to remove the software node's name matching against GPIO
controller's label that is going on behind the scenes in software node
lookup. To that end, we need to convert all existing users to using
software nodes actually attached to the GPIO devices they represent.

In order to use an attached software node with the GPIO controller on
rb532: convert the GPIO module into a real platform device, provide
platform device info for it in device.c and assign the software node
using its swnode field.

The software node will get inherited by the GPIO chip from the parent
platform device in devm_gpiochip_add_data() as we don't set the fwnode
using any other of the mechanisms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/rb532/devices.c | 32 ++++++++++++++++++++++++++------
 arch/mips/rb532/gpio.c    | 41 +++++++++++++++++++++--------------------
 2 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index c3d8d96d0ef555d44749c5fd3673b1e5afc407ff..a6e3dc11298b719c64013dc38bcac7cd00e3089e 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -240,6 +240,25 @@ static struct platform_device *rb532_devs[] = {
 	&rb532_wdt
 };
 
+#define GPIOBASE 0x050000
+
+static struct resource rb532_gpio_reg0_res[] = {
+	{
+		.name	= "gpio_reg0",
+		.start	= REGBASE + GPIOBASE,
+		.end	= REGBASE + GPIOBASE + sizeof(struct rb532_gpio_reg) - 1,
+		.flags	= IORESOURCE_MEM,
+	}
+};
+
+static struct platform_device_info rb532_gpio_devinfo = {
+	.name		= "rb532-gpio",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= rb532_gpio_reg0_res,
+	.num_res	= ARRAY_SIZE(rb532_gpio_reg0_res),
+	.swnode		= &rb532_gpio0_node,
+};
+
 static const struct property_entry rb532_button_properties[] = {
 	PROPERTY_ENTRY_GPIO("button-gpios", &rb532_gpio0_node,
 			    GPIO_BTN_S1, GPIO_ACTIVE_LOW),
@@ -309,17 +328,18 @@ static int __init plat_setup_devices(void)
 	/* set the uart clock to the current cpu frequency */
 	rb532_uart_res[0].uartclk = idt_cpu_freq;
 
+	pd = platform_device_register_full(&rb532_gpio_devinfo);
+	ret = PTR_ERR_OR_ZERO(pd);
+	if (ret) {
+		pr_err("failed to create the GPIO device: %d\n", ret);
+		return ret;
+	}
+
 	gpiod_add_lookup_table(&cf_slot0_gpio_table);
 	ret = platform_add_devices(rb532_devs, ARRAY_SIZE(rb532_devs));
 	if (ret)
 		return ret;
 
-	/*
-	 * Stack devices using full info and properties here, after we
-	 * register the node for the GPIO chip.
-	 */
-	software_node_register(&rb532_gpio0_node);
-
 	pd = platform_device_register_full(&nand0_info);
 	ret = PTR_ERR_OR_ZERO(pd);
 	if (ret) {
diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index 9aa5ef374465c429046c52c5448e2fadfc82e131..49e1a15a3827ea557d4d59ead85a19ecc44cb8e3 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -37,7 +37,6 @@
 #include <asm/mach-rc32434/rb.h>
 #include <asm/mach-rc32434/gpio.h>
 
-#define GPIOBASE	0x050000
 /* Offsets relative to GPIOBASE */
 #define GPIOFUNC	0x00
 #define GPIOCFG		0x04
@@ -52,15 +51,6 @@ struct rb532_gpio_chip {
 	void __iomem	 *regbase;
 };
 
-static struct resource rb532_gpio_reg0_res[] = {
-	{
-		.name	= "gpio_reg0",
-		.start	= REGBASE + GPIOBASE,
-		.end	= REGBASE + GPIOBASE + sizeof(struct rb532_gpio_reg) - 1,
-		.flags	= IORESOURCE_MEM,
-	}
-};
-
 /* rb532_set_bit - sanely set a bit
  *
  * bitval: new value for the bit
@@ -199,21 +189,32 @@ void rb532_gpio_set_func(unsigned gpio)
 }
 EXPORT_SYMBOL(rb532_gpio_set_func);
 
-static int __init rb532_gpio_init(void)
+static int rb532_gpio_probe(struct platform_device *pdev)
 {
-	struct resource *r;
+	struct device *dev = &pdev->dev;
+	struct resource *res;
 
-	r = rb532_gpio_reg0_res;
-	rb532_gpio_chip->regbase = ioremap(r->start, resource_size(r));
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 
-	if (!rb532_gpio_chip->regbase) {
-		printk(KERN_ERR "rb532: cannot remap GPIO register 0\n");
-		return -ENXIO;
-	}
+	rb532_gpio_chip->regbase = devm_ioremap_resource(dev, res);
+	if (IS_ERR(rb532_gpio_chip->regbase))
+		return PTR_ERR(rb532_gpio_chip->regbase);
 
 	/* Register our GPIO chip */
-	gpiochip_add_data(&rb532_gpio_chip->chip, rb532_gpio_chip);
+	return devm_gpiochip_add_data(dev, &rb532_gpio_chip->chip, rb532_gpio_chip);
+}
 
-	return 0;
+static struct platform_driver rb532_gpio_driver = {
+	.driver = {
+		.name = "rb532-gpio",
+	},
+	.probe = rb532_gpio_probe,
+};
+
+static int __init rb532_gpio_init(void)
+{
+	return platform_driver_register(&rb532_gpio_driver);
 }
 arch_initcall(rb532_gpio_init);

---
base-commit: 70126d34d0d65e2294dee3e5ee9485fd1875e8a4
change-id: 20260430-mips-rb532-gpio-61b3982b4ed6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


