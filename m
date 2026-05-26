Return-Path: <linux-mips+bounces-14777-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKMfOtPRFWogcgcAu9opvQ
	(envelope-from <linux-mips+bounces-14777-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 19:01:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0255DA480
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 19:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB14F30BD888
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA963C5DCD;
	Tue, 26 May 2026 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgCOxuT0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1SPuh/V"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96F03C9EE5
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813657; cv=none; b=Zqn7KSl7DfE/3EXvhpyW/rw0E5ar3JzirmsM/zzihZTzxyzSbSXnioQLp+Iym2X4IEHDbvQvl6cykkjJmtImrYxOj4S391p1Xcsswrf/sZFN4MGucHT2wTM4U67zaP8vA/jNTDJtXP98tSbLbzTK1LQxAVFzZZhz9eYrP5Rjt6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813657; c=relaxed/simple;
	bh=k7ZW0O9vAbN0v2YgkpDd6Lr3f61vP/lKqMLDraMQyMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Enf0vVMhFOy88xcIusVENOOltPW2d062w5aiVd/VjUo0I0SUqD2xou6XJbrQ3Ce/Pq7fZN2nrKurM8kyrLAYF0mHhw5eKfZy7LPtG6KQ80Xf8JTk3Dt62zgrP7NYDA3MFNb1xvnF/gT3LrIGWdejWiUvpqPYtScE7vdhDLpAar4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MgCOxuT0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1SPuh/V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QG0jDx3322284
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lzGOw3DpCnZEragGQkaR8D3j6QpC3n1Dj8YoX49wt7g=; b=MgCOxuT0QQNLPc8K
	Yjh7bQBzfzaLd2cr2+Ga51YREM/n4ttW8nyzWOzxU0BIoYBs3cVjhXIELb8A7SFd
	gP+k0aqXvAXg/BYN4O3/POcmfa/ixAtE/gdk6tThaYqRZJzfHl6iEgy+0ELXV0jJ
	JaQY6m6h8kFGRfccbhAoUesixsf8h8yY6pCCTRtcW+aVKVPpKU/hyjJloj03Wov8
	sZIXjNoyvOMJyAGIhouw1S8ygz5+0oNpwqZRaejlzxXYIHJ4lkqcpOJ8SL9S0fcB
	/yTw+FSEUVpDlbNG/D79iuVMT5vIg097hONvjnTFmhfRrwcmEAToVVaNm9aN0flc
	lFa/QQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentg7q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516eaf9fb76so55938421cf.1
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813654; x=1780418454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzGOw3DpCnZEragGQkaR8D3j6QpC3n1Dj8YoX49wt7g=;
        b=O1SPuh/Vpomfj3v6/mEPHvpi9dYdU2YPMb3TEOUB9PXC1GzCWWU3dcWFtCezFnED4K
         duh/HlFqcrXUehsrtQzMB50VdEBdztGDTIcsiS4nyFZ6J6/P0tKIU6IGzSoa+lRsj0IK
         65eTkw8UIBsw6dEM1sDZfCBx+CRj3Jaglr8vrzfd9cn5c9x4dF/5llDxt8/QCdrhmn6i
         TSFwlfbUTh5HvWP2qF+SPaVPbpQOCvsaNTHbbgvd1/VlLzL2SzsBugvtXLQYcYGffiyH
         wMtr285k6smGob8E9dX09QrvgYpH3ZEnBQ3lWHWar6twjxO2R9eRVyz6iDSiqe2me9tQ
         NbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813654; x=1780418454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lzGOw3DpCnZEragGQkaR8D3j6QpC3n1Dj8YoX49wt7g=;
        b=mV24zzW6lZDix3RN9JFIDa38zmuFNLp2siAdXg+Hvq1Fujf9S4ASlosq2rY2yBgnkE
         RSVH7ii0DHZdHP2g4YwRlRcsoButG7tweW3MVMPA3acZJoXgd8Jd/XCur0ESBgm/BVae
         GAUeRxvxejojC+BlWPfIU8zdDMps1o70rau6/SNumsY++AjuBeFkLaMdCqqfCOSICQ5S
         Aqe3ZiPavNBRjcPPypfl2i2j5UvUpPS/Tb6hFlgfAj09rho+UW2KfBOJEjFveYNNGl8Z
         UxB9bI1Ibn0GSHa7DeIJ2H0hDGpMyzKasPCg2ARWzx3YRPqXVbKVJRhSY3c64lqQlMIY
         fjFw==
X-Forwarded-Encrypted: i=1; AFNElJ8A1BByFjbS3m9+Vl/2NGqe/Jc7WGhDU6z/Jz40X+q9UTOhBQI+8ySYlK0W2TtHayyL67Nc4MquUZOP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz95XZdgwqZT5DWrKL6rr9tXXD4ncBfSzBC6fQJ15D+mQc9t/GF
	XM4zUplmE0LKTkOf+iaiOrnNBuB+J7x/PlzPraNBDcEqc1K3rtB9nu2YtusgikGl8UgNJ/URK9Q
	bsAPhzQHYf/ankfb71XgBpyrUaOusc6aG/vUGtjiLFnsJuGT5hJPUGTEHyfEmqUu2ID+hkUMs
X-Gm-Gg: Acq92OGGEoHI1Nend3s5kjCTQCU5oYHnDuXbf2hnS/NGErQIn/madXP5HqrnyXiAipy
	RjMkomKCQeg/AKYB5HYil8GpoCgG5sKqCtPJDIm2xvIg1mN4Wf33sqUvJoxaA+WqLndb/vsusTt
	/HIDh9RNv1YQCOU/PLpT8RIDonO8pX9tTkJxFWzDKKsf7jt4OKrm17agDp0CCQdttfPJy8FfJlK
	zkU3K3YWNxDuWzhLGuNLRawZeuipMUH6I58drymkZNlNgniLMjsSwMNiE+rDOKQcKdIGs4HpU9/
	GVRTd5+OSELNA9ITylBqH9M+xpgra4C4dSEzhHe4FbRiVZbfl2w6Nyz/r6gtouirP8Qi+399gLd
	9kq+pBs5n0JlCHFSpQ2kP0V8vQlgSBJc5NqON9GlRdTsYyIeV3pc=
X-Received: by 2002:a05:622a:550b:b0:516:e10f:b1fa with SMTP id d75a77b69052e-516e10fb407mr170406621cf.2.1779813654185;
        Tue, 26 May 2026 09:40:54 -0700 (PDT)
X-Received: by 2002:a05:622a:550b:b0:516:e10f:b1fa with SMTP id d75a77b69052e-516e10fb407mr170406241cf.2.1779813653708;
        Tue, 26 May 2026 09:40:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:40:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:40:32 +0200
Subject: [PATCH v3 1/6] MIPS: alchemy: platform: add missing include
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-gpio-swnode-alchemy-v3-1-2aaa1238ae4a@oss.qualcomm.com>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k7ZW0O9vAbN0v2YgkpDd6Lr3f61vP/lKqMLDraMQyMQ=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGoVzQuirduTyuXZttYqXGgJf7KKJWjTGawFCxpLCySCOIqMf
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqFc0LAAoJEAWdLsv/NoTD1asQAJFl
 2/8ZlYNyk2vNNmFHbhgJZvGfuyJ7W1MWQ05rmkYiNw0rrFpeJKbPdZlFL9+61BSv20gqOwLUrHH
 8950m093qQ/tIG5h7ZinnCAuxvJrcGOUGvBdgKebb5Rklyfhpu2swQlSiaRXQtmJcf2GEW/emWV
 dLeX9Q8MUGBtYLSV1d3KAXq+pnhNX4tQmOYf9TjwIKKme7h4LCTRmpdvbYECUyF91injVXPZYIu
 JCuU2cKODye92/cLW9/FojHq1u+JIlE7WHExKchxVhQV+7nb83uEkUF0vvubj3cZkpEFLvZDJ0G
 +gBsfd+rvTcv5ynbVeLVht0+erx4M/4nkaiziSRL7xtRqxIjeH79hcZsA9vSMyiVMm8WlhbUtN9
 xwrB30NR+mhS44xyt8n52CnJzJ4NviAYsw+iYZ9G3YsdlRMKYGNxkaJ9tFx9dVBA5qPQSbYQx4+
 zbEGYHIoAkLMvv8smvdfghuYZHAh6t1H7X2QPvAP+qs+hnm8DeA6TwFDDkJ6/+MXEHU9EI/uyAs
 aSYjiQTGGheEUoxeiyMJBa5tC6wPsvs5iQQyuLi7q8h/fHTNOkVmnQxsIQI7lfARfViKSEzqBD1
 1wn3l3Ggg4Lg8B1JfStHpCc3C6m0vwLu7I7Nhe/dRaYQN+fsk6Ou7sDjmrbGXeA9V0sZlh9J+1q
 sJRCx
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a15cd16 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=WsugvLXgGilFTQl6Q-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: AWTRm2FQFnRCaElcAuvbOYOT9mq4xeZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfXwuwONlFb21G6
 iyoheVbfj0Np1O9ORkGmHYaqxZvejqP5c9FGrKz6vJkAbbi5vT+7JlgY23PGMJ8oM5+sYSSZqKo
 putXyte2OrDrNd/ZiJI+LaUxYtGqJrGxvWd8SLQtAVqbsD4O3fjssguw7nK+kRCYxxGLxMAhycv
 8dQWKgSiXFXvEoQ9uPqqqoA+er31f8CJo84vDULowZAI8aPGfk/BweriKYdvw/7rnKc/RVANiWX
 F4QlJha4CdYu1JrmukqeEGgY+qrjvGK4EDMmCw3u8QfljQCz1KG2+k4FjMr1q1SFyGm4ResHuNn
 bpIbkrHdxVIbCe2KuNqNphJMa/1t2VBQCawGCS+CElf2cdt6SD/jHOHTmW09N2WiHHcP3aVFjik
 EDSyBfWeT8g8Hslvk9/uS49FDuxfU6VaejNDtP9uWBNdzR+VG8UVYJ1f3RIcK4S3Aa6exIfkGbm
 itDuTgLi4lkmAKZT1Hw==
X-Proofpoint-GUID: AWTRm2FQFnRCaElcAuvbOYOT9mq4xeZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14777-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4C0255DA480
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Pull in the platform.h header into platform.c to fix the following
warning:

arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous prototype for ‘db1x_register_pcmcia_socket’ [-Wmissing-prototypes]
   68 | int __init db1x_register_pcmcia_socket(phys_addr_t pcmcia_attr_start,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/alchemy/devboards/platform.c:152:12: warning: no previous prototype for ‘db1x_register_norflash’ [-Wmissing-prototypes]
  152 | int __init db1x_register_norflash(unsigned long size, int width,
      |            ^~~~~~~~~~~~~~~~~~~~~~

Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/devboards/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/alchemy/devboards/platform.c b/arch/mips/alchemy/devboards/platform.c
index 46262c823fcb1d10a67693dba8c4a9ac182cea27..fbc93d729c50b18953482d4ce8c0afb87a230e43 100644
--- a/arch/mips/alchemy/devboards/platform.c
+++ b/arch/mips/alchemy/devboards/platform.c
@@ -20,6 +20,8 @@
 
 #include <prom.h>
 
+#include "platform.h"
+
 void prom_putchar(char c)
 {
 	if (alchemy_get_cputype() == ALCHEMY_CPU_AU1300)

-- 
2.47.3


