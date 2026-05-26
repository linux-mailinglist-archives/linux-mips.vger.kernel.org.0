Return-Path: <linux-mips+bounces-14776-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAZfMAjUFWrRcgcAu9opvQ
	(envelope-from <linux-mips+bounces-14776-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 19:10:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDA35DA60B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 19:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A627330958C1
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2763CAE66;
	Tue, 26 May 2026 16:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bf127Fz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NR4q0l9l"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE213B0AD7
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813655; cv=none; b=Cf6FHfobZw1uQ7PgmdNcYGAmIh87nSrnRuU4L8SrTpxJ4nYg1NBVFl3W7xM8IiPgmoLufdtXwSUMXGfZp1l7tFeSRaPV//ptE2tbA3Qs6ISFpbXlaV1w5JGIXkShyvODc5ndTOUK/clnQpXWTy6oHhOPVheBLc+c6ktkogYDtO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813655; c=relaxed/simple;
	bh=60nS80f4Vgz+mXe2XFI9KQYjdxwmeQfkG13nY/kEkdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rVMDF9kvbcD7qaLnWWH726jagZKrRA5ZfbqXKMlsfJXHnApgULf3rf8WRLDoCXGtReRHWMXPXGnzb5GBxAo513txAzGhTJXCWciSh0cTr1YpJnFQB1IN/n/F2XeAtBH+UWOy0KQHxf9fMPtiiMbWJgwqsaHNFrmamPeNLlu6o2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bf127Fz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NR4q0l9l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsPfD2697728
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YUb9Ym3J9E7ephhyYyFeZM
	rm6w91RdIiXcijOjIXP2E=; b=bf127Fz0NAwncoWvzCPVAJJfb9yGCG4u3vxT1M
	El8WJNY3DraC/Xbzr4Op54spPJM4oBFYgHn/sGXmm1kaYMbnWOaxeNjkKPuKgxm0
	v/OpvngbxeTCGPX/8FbrEDd9lL6Qve7KgDZzU9h3eAaJF1qmb0Np5Oyrv/V8vy1A
	NH+hiquRGrw6xL9a+v1gvLKOnWrXULP3il64ENqSo/uhbT0L1GiNZCoOZ668kQe5
	9n2EUFLuZTllV0Pm2MfhnHgCTHJ4KGKts1veW3F1GaN/DT5ecHERenDRN7988Tyu
	jtvPtOn3MHT0JCoiJa9qyc9EOgU3IWsohNzMF4Tq5KdBGdMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecsm04yf7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d19f68acso98929531cf.2
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813652; x=1780418452; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUb9Ym3J9E7ephhyYyFeZMrm6w91RdIiXcijOjIXP2E=;
        b=NR4q0l9lw//hSHB+r4vtooFZ/tzprdH4vBHxb39gyIMO28oXiKWpkyr4AT5ze54lDi
         MT8Bf/8Wcnu+1wyE2JZMNTwNR6xpZsbyz/IXewfh5MabRMJstIBsV2FhA7NFLn9S3ZFB
         JhD0lWjs/pyBZrkZNKuR9cfLxKXCfHivOLlhHVL2nD+qKGXJ/kAz5nG/eOHXxqZlxY3Q
         H4dDXVzQAY4zTMRmjIgdAfyw0iIG6GpdfDTmFb3BreGo7lba1r/4HJDoc6Yc/pdxzk5A
         0zeoL+nSi24tTOm4BILikKhAnwcWSPefiOy1e79Fr5mex66HivkZd8wDTCD/sUG2LNvS
         hrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813652; x=1780418452;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUb9Ym3J9E7ephhyYyFeZMrm6w91RdIiXcijOjIXP2E=;
        b=kxcz3qon7P9mkbYL3gTFRtAmxNdugITIm2Yhqb1UQFpU0loBdg4OCobTuu7HUH9KrS
         tTaqKz2UapAuLwkrFhai8YfGYFfwgrpRA022vl4xBGAj6VzsxyFYwzieE6I0h9iOrwAi
         FslgsZF/8ZcLUbGUsW36TuuCLWBeyK1XcqQPzuBZnd+qD9I4CWXWTH8NvIXjfrOKG2yW
         pYMMNEgn48yMdxJx2gK4z0JPZTmvDu2KJjxecMKT6UlHaZ+zvoVtdIL4/inDBEt7iJmv
         SPhWboiTeYtgR/ViYQKsJWZFo0+qsbc7O5vnfniJnvM72vgbZqhOCXoomIl8WvDoBTV1
         ORqw==
X-Forwarded-Encrypted: i=1; AFNElJ8sM7tMTNBoLiGhBxJ1wVfuiNm3jQ2CBoy6XXNqJQT9vL/HcE3mnrNEWAfwvVBnzMRRVeoMiy4cJ20w@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRK9NXkW1VCLAiwpW1oX+GMY3TITmThGChdJkoHZgLdDRdOAt
	/2rg8f94PWliUJnFtMphxNvAbkatIBr47SpiRnAfY2eLhbj01cw5hYZINzTOtULcEQH0GJt2XSK
	5DQHaRjLb6s5LVOS5Q1jVtMnoLQq0aYwtDGbZIflKXhiiqO+fsoOScskdqZPlR2kX
X-Gm-Gg: Acq92OGDPPhKGsjYceqDsXJF0u5bZAof5qNzv1efSMtpJy9rykFXf1YqRjLyYUHjOPt
	Gy5/5rPAbAEaK6Jbj7wu/r601LrDuMxzYHWyHEcS8JPPVa6Bv8bcGtOi+y0x8q5YBiFMRK/tKbA
	SYKtGld8mwEGa0vmiORzACf3IksOldsAjz173MtACL+5TW0E5/ztSt+ZxaOTR5cBhQpOcs75fah
	D93cz/bCHw9GkQvdGmFMHvSvLS0l31bsXexgbKsCmmfJ/e2mAYWBmAcgS6QRvm77Tuwr83hLCj2
	kW6cuXkojjSXMYORoGsIH96wJhyBN+8gwS/5mPaDTyAa98212N9riAVLFghVvwI/DHJQtRhMV7g
	Y2FlRnWoDiHTkdv8lOBOt6Y4Yu89gm+2FZUQusq+3D2Hag7aQqzk=
X-Received: by 2002:a05:622a:1e9a:b0:516:dd65:21b0 with SMTP id d75a77b69052e-516dd6524bfmr216686401cf.49.1779813652463;
        Tue, 26 May 2026 09:40:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1e9a:b0:516:dd65:21b0 with SMTP id d75a77b69052e-516dd6524bfmr216685951cf.49.1779813651923;
        Tue, 26 May 2026 09:40:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:40:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
Date: Tue, 26 May 2026 18:40:31 +0200
Message-Id: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP/MFWoC/32NwQ6CMBBEf4Xs2SWlWKKe/A/DAcoWNhGKXa0Sw
 r9b+QAvk7yZzMwKQoFJ4JKtECiysJ8SlIcM7NBMPSF3iUErXSmjDPYze5T35DvC5m4HGhcsW+f
 OtijIHC2k5hzI8WdfvdWJB5anD8t+EvXP/b8XNSq0rVanxlnTmurqRfLHK+V+HPMkUG/b9gX3i
 zHsvQAAAA==
X-Change-ID: 20260505-gpio-swnode-alchemy-3bff9c11e54c
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2553;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=60nS80f4Vgz+mXe2XFI9KQYjdxwmeQfkG13nY/kEkdw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFc0GmB8geRwuBLywMnHBzMagbjdMs6yzCvO8P
 W4yZ9xB1Z6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahXNBgAKCRAFnS7L/zaE
 w6CuD/wInrwNgCDztWCSd0+KytdlPEmflQdMIMfBW1PrejV4AY31ItBOvGxkOGMhGLRcdnd/Rxi
 FQISV0R26Lo3UuYcryv5DqZUzcBDt3KVjp77b9zsAsRY6XPFKnGizJLeyKoivQSy3cn+m0SspJB
 JMlfIhEiRWtFooxQiSRx1MCwJ+V3r9LAfuHTxvpWCOSdvI3lj389RHPPax5OUNkjdtKws3c/lzr
 PXSyiMpCN/PHyl5BwjNtJ7YDgVYnf05sL2/vQEo3RLWGcuL5MEcIDQW5gszAMgjbHeQbJodfDw1
 r2paG2V7CnvHP0t05rh3rdXfj/uxDX+pNL60AXwf8ljbzdTocWkeWGcJOdvPA0JPTWBsTKOReh6
 xgmwfQc0k/w008oBDFkAWY4IfApiVGawOGxEJYSKnDkyJR+BlQYrvwdWsxYJWNYyG5pqNRjUGXs
 IefsUv9bOxzJhvbH32RaFxIsPf1jSDmVwM7aLQGjPohHTImGRI3J7F3F37SvpoUoHBCMkdH0LJN
 /FDD3/jDVh/2eSyzF10nmmdRccKCxdBuKAEshLGNTHs23RHRqH9PKHp+am7d5Lr+O86tvPTKYA4
 uCtatfkvUuXmycNnOZMycMBelYEJLxt+3sYKudVohoHUq90jezNTDKpHsWuXOG08HnddOUsrV2O
 6wqCp3QnhjGEabw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CLEamxrD c=1 sm=1 tr=0 ts=6a15cd15 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rp0JIyO04VhZ70VToYIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: CFiZ8mGy3f_tHTZdXbHqaAW8AoS7onhQ
X-Proofpoint-ORIG-GUID: CFiZ8mGy3f_tHTZdXbHqaAW8AoS7onhQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfXwzZqvQUDNC2E
 UW/+xUHMi7x14dqvhh3FmRaDtOd46jWNDU4LhR5gNCKfZo9gzwiq6selXXD4NdG5lY8ne1Q5L6V
 XADCVhXtVH1AMHawbMobWR7+mPJtf0d9WUK5QiTF7OahPDifVP0uz5dY8J73/wIv0FRepjCLe3v
 0gge2F6KU2ibuP3bIxbWEWMSgvE6/PPpPf0K1DtiYFrwOrjDvw57uyIbTgupQqOAtS09k1/WI+m
 UempL4wvqweAAQcd7zQ0vb6OlgraiirUvtpFleAHrAyMZkvJhRQEIp6WD2X/Bl2SldXfAq/UAqb
 xGVcqpVbtUI4kjwb+IXOd8QW2QA8YWvVP0UWPD2XyV17HnzZVgcYipGvtALmYUE9Q0Y/dFs57hI
 PtLJ4KX84ZbHQ80jucKQrN7U5I9vJb5X6BIOhYZC5V82nCBKqyUAzYTg2dWf53MrVYkq+Rbgrtx
 eavHgVXuddClrocMICA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
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
	TAGGED_FROM(0.00)[bounces-14776-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1CDA35DA60B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series of patches updates board previously converted to use static
device properties/software nodes to attach and use nodes attached to the
respective gpiochip devices rather than simply defining unattached
software nodes with matching name. This is a requirement of newer
gpiolib code. Note that there is currently a workaround preserving the
lookup based on the software node name, but it will be removed soon.

The additional 4 patches convert the remaining 2 boards to use software
nodes as well and fix some build warnings.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v3:
- Avoid compound literals as older MIPS gcc seems to struggle with them
- Link to v2: https://patch.msgid.link/20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com

Changes in v2:
- Add two patches fixing build warnings with missing prototypes
- Use the new swnode field of struct platform_device_info
- Link to v1: https://patch.msgid.link/20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com

---
Bartosz Golaszewski (2):
      MIPS: alchemy: platform: add missing include
      MIPS: alchemy: provide visible function prototypes to board files

Dmitry Torokhov (4):
      MIPS: alchemy: mtx1: attach software nodes to GPIO chips
      MIPS: alchemy: db1000: use nodes attached to GPIO chips in properties
      MIPS: alchemy: gpr: switch to static device properties
      MIPS: alchemy: db1300: switch to static device properties

 arch/mips/alchemy/board-gpr.c                   | 127 ++++++++------
 arch/mips/alchemy/board-mtx1.c                  |  34 ++--
 arch/mips/alchemy/common/gpiolib.c              |  45 ++++-
 arch/mips/alchemy/devboards/db1000.c            |  31 ++--
 arch/mips/alchemy/devboards/db1200.c            |   1 +
 arch/mips/alchemy/devboards/db1300.c            | 219 ++++++++++++++++--------
 arch/mips/alchemy/devboards/db1550.c            |   2 +
 arch/mips/alchemy/devboards/db1xxx.c            |  11 +-
 arch/mips/alchemy/devboards/db1xxx.h            |  18 ++
 arch/mips/alchemy/devboards/platform.c          |   2 +
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |   5 +
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 12 files changed, 322 insertions(+), 176 deletions(-)
---
base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
change-id: 20260505-gpio-swnode-alchemy-3bff9c11e54c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


