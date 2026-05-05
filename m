Return-Path: <linux-mips+bounces-14448-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAMxLsez+Wly/QIAu9opvQ
	(envelope-from <linux-mips+bounces-14448-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:09:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAFF4C93D2
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F2E3090278
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BA63D333D;
	Tue,  5 May 2026 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+6tRDwO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxDhzSGb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E0F3BE16A
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971904; cv=none; b=Wcbynvq8LFl7wSxUIcHAMi+cB30xkloWEDzumBNzCRmKS9Kr+e6aRnONa9ovMNfO8xP3cR9JaJ2r7h443CKfc0eBOVr5XGfK3oLta/4FGTFOzH2DnH7Y98haKOqDZsuaR02UXIWQQqECdYtHf/9pSd/D6F0n+UQs8bEU5MeLGYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971904; c=relaxed/simple;
	bh=t+icqeEoiY+KcgnxGpNWtWdscrRBCeIqg/r15pU/Pbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbkZIQp2hNhZyWFdWJzQaWb4fOEksiNvlGf4Vw7Uybnw+PqS8G132ku24MrGUcw/thzy2Hq8egyMFs3pv458Icde6udy+FX+3Um/ns3dNEPpD7CAZwEbaUWTietfU92SoCcBDljFzAOEMMyivJaKvpW3DiAjuuz8LZO0st2LOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+6tRDwO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxDhzSGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6457UbQA1186923
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kbqkJeBsX1wbON6raniruchDjTgiZzN7QgYGEqC10JU=; b=L+6tRDwOAZeStxIV
	miaeo2QEZ1sVcJNONcIv76NxUwoqoYWVW0M/9Ol06P+X8+fOqbVBYjV8rTXoaKRN
	tYhqKRBjUT+sW+pCFF4FUoQSQL+Us21Yc0066kPc9AlJGo7x0PquUHEYMgySj0b2
	6lyQG45kqVn5usQK7kQ7ija5+BrAVfLx8yt/wXe13Ojid3/Fd7UYlIKVsdu0Nys2
	NPlwi/pc+ixatndAzh1TNexsFcDxzNpZiaSKhY61JUr1QCTZy6p++6EhqZaY4ErX
	7wYcBtigezK0Jjx6tXZO0zAaiQ7KbLZLbAfUCoDGH3C3IYM0xZHSMkKA+n+feoP+
	pSPssQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgbhv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50ff0bef198so129103361cf.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971901; x=1778576701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbqkJeBsX1wbON6raniruchDjTgiZzN7QgYGEqC10JU=;
        b=JxDhzSGbZNm3vr4nj43OqIZwi/NfMBLhQKlBtG0OYDGZbEhTKvvUQ3S/jWU+5f/nc4
         pxJTpy5dyiR/tAqfP+EJiB9ck1qpfE9+CAnqPdYZAbGcwUX5h4sIKuJftQYZZJfjgLzH
         YfLWnTzQoYXP88DuIhq10+wGmCe52ZUfPu5uukn1JxS8RzgiPT/SZrcHPtUY3BaZeOZe
         kbgTwxKVidm+58rZNNj8apZKxSbhRaqbOR3o+VvS7g3cMnGN6BsxLlmwCnisLibuU08V
         QRhvA+XewSv6KlW4MvQBbl3NJCJdd15HiUwr9h5DLaZKwJo9zBnyf3yiE3A8pnHylM8g
         5d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971901; x=1778576701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kbqkJeBsX1wbON6raniruchDjTgiZzN7QgYGEqC10JU=;
        b=DdUTiK+6DZm+p2Icg4ZZ94TnviaWvD2IbJ9/CP/ofZiubHRMYULsdKuz4NGiDMJXCF
         l0IDY3s7jtFi07Bsd8MSTvU4JGj18QqZ94abDpA8BsBaUEK+Ytgb6cOvS2oaI6lgPOtR
         gkXmC/PLtp7Bc1eY1evyRPmR/yK+8ulfC1M22lD4fcVXhvPKFRBhWr58xutTDBNyuUOG
         eB41iLo8Sre1HGdKA/ATz4rLP1dGFMO8qIsga9U2+APjNGNRTmcVoER02RkM1tVkyVNn
         hZVIOz5yU8bWIok34f1EdrpZlyGCy3cI1rDVzAOkflu76QyANFYOHc6SW8wzt74bmZtv
         goZg==
X-Forwarded-Encrypted: i=1; AFNElJ/zSocfnEUB6+KPzzKzYQFEsRdzbxDsRZsrmysymo4ld70lKc6lZyofNqpdqlcPiBHlZIhdVe+i9Eh6@vger.kernel.org
X-Gm-Message-State: AOJu0YwtzqiEMHYoyEl3yiwLA++HErRMDX4N34THo8oNwkbstc80ftEU
	3GejdH98ANuWsDWJSmL6aTZzs9FT8gxsrAP2R9yWc7M4++G5nH2W2A9P2CshFOZPJ6ZJllDh8oX
	4+ja9XgmzU4v5v03nuUqlIIxJwvQ3Rn7mg6JvWvFbv2GEDfvXehV9rp/pqB+bxJlj
X-Gm-Gg: AeBDievAG4bH3e57eYe/BM5FKrWUhITFF+ETIugzc7zqYKShOrGbS4siY+vY6/4GS4C
	SJA+byTwVmPnr4Rapb6Vuhu2pnGdd1uyZzrTFRqdjzyvmpfsZy4Ux4QtX9gKf6TsqND7E7Bd6HJ
	hrNdmlRSL5IMwDyUjpKLy73EvA1lJy8JGffxVgM/Jk2YFXXC0bNyODkYcxHA/6t51WMawaeOEdH
	/+ECoxoXl8v5fei8aGsMSTIOIhPQdf02fJ8sHxHDCZpQET8+Nnr/Ivh7lnhHZSI9dIsMVgMf9dm
	UaGnN+h3ikauGEvxde2sAuFzRVWfIA/KuSdpRQ714nJDPSSLsZvan1U9JOwi0D6U+ztSa4fYM+T
	NJtuON7xViQvC9peLU+7lrlktJgCfWk4aXu9Wpkb6rBTor8Z12rKPTBJuAQl9ig==
X-Received: by 2002:a05:622a:903:b0:509:25ab:f545 with SMTP id d75a77b69052e-5104be0e45amr182203491cf.11.1777971901346;
        Tue, 05 May 2026 02:05:01 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:509:25ab:f545 with SMTP id d75a77b69052e-5104be0e45amr182203001cf.11.1777971900739;
        Tue, 05 May 2026 02:05:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:05:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 05 May 2026 11:04:41 +0200
Subject: [PATCH v2 1/6] MIPS: alchemy: platform: add missing include
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-gpio-swnode-alchemy-v2-1-cb208afc5b56@oss.qualcomm.com>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=t+icqeEoiY+KcgnxGpNWtWdscrRBCeIqg/r15pU/Pbs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bKz2dywPuUgzcJzrJaVgMJ1YWMAde2LdV3pW
 PSFyslGvhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmyswAKCRAFnS7L/zaE
 wwxxD/9RRAoB9/Um3joqriZf4rXrBtUFSwA8+UZA9iB97gVUSOs7UFI82SQ+ub7F/xWfkVExrOi
 mg+PIBJCpZLg/saFWj1dyHuks1HxWwwjRPJXFfa0JIFSzmnfm6KUdPG961uPTOp78lTVArffF/o
 ipac93t7A+tCRTRp6Kqc8UWNmFqsCOtU3UY4RygG1d1qzl6gBmBdJbCDiHQF8Scl42Y1zoIWDJO
 JJDlO2qpTNBCxnxD+u8MWiA3EdQ0nuoHmXkxMtH6P+IdzdmlJXIAqmWyH4nXzvORLFp6FFPQM/2
 7bcagl1C3YkqqgB5zj5LscoVDy6Z1OAYLNhJEkPU/O9re3qg2BrpuFGJfL+xNUrpZajgrHwuqRa
 CaSwOBi0KCCL/Jt6scxahCwsUKK72XntzlRfZX3d7yPJ9e/EVYwSMekybiNd+C7DfgdQhFLiyvM
 CSbOSPDAJKxMf9KtDDtlHxBXP47yDDZQw5sn8fKNVZ61dbm/8vrLdfvCLC2zyVacDDt4/GSMMX5
 Og8yLIuM0DB2jfxeeqp41AtCTpxM+x65m1fTkZdxGh0rRUQ9L2UP4NhWLkJjRUGrmhE3TPw+LNV
 HwAhoWwTIrZLcWhmCUaQnzWb4OdNy12wPvshKtuO5QsKnWjXDoXOwlr1JNTO7lPcoDVOzE+RUNY
 A5OAAv9nsluUb5Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8F6or9XTjz56WLZPrNRyDyJwGy5VWSpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX3e2vMp6Vo3hW
 cSwA7EKypEFfWpiatTBA0U4RN2QKvRGbGiwNPqsSWrNoLSAMPHJfqk/ORZfm6TAC9Ult+bbqBVV
 /rDK4m9diHRtYVzu5t9uOGLyWogUwpgRjPMokv8QLUAgAcdzg5bw4cfnOixuT9zTK+SWg69H/qG
 77DSC+VkHllOHQpZTXpDwLE7/YauV4xyeImHhOntTd+Tq4RoFlAxEVfrBXq3riKUZjuW2EI50HQ
 3FQcXSjF6z+0FbelYauWoDwFVoXckX5nlRilHjE30AhzFxVUSDXk8lFPPkM3CGzLm8QpJap99bO
 7sQ0duSKOlOe2kmkb0jaT8iqbfPEO1TEdytkNMu/j39NUr6wP5RmskRbHQjRtdlUdcb+PwbrrXN
 bIBo4tnwnQYc9oXJ1y4YUXq5K5NUFtdB7DDlfG+o5lMfr8NKXluzknpSJ18nVbLFzrZnTyxvFlp
 ARr/yVPary444MYDLjQ==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9b2bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WsugvLXgGilFTQl6Q-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 8F6or9XTjz56WLZPrNRyDyJwGy5VWSpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050083
X-Rspamd-Queue-Id: 0DAFF4C93D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14448-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Pull in the platform.h header into platform.c to fix the following
warning:

arch/mips/alchemy/devboards/platform.c:68:12: warning: no previous prototype for ‘db1x_register_pcmcia_socket’ [-Wmissing-prototypes]
   68 | int __init db1x_register_pcmcia_socket(phys_addr_t pcmcia_attr_start,
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/alchemy/devboards/platform.c:152:12: warning: no previous prototype for ‘db1x_register_norflash’ [-Wmissing-prototypes]
  152 | int __init db1x_register_norflash(unsigned long size, int width,
      |            ^~~~~~~~~~~~~~~~~~~~~~

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


