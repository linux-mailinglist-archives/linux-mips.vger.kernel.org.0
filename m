Return-Path: <linux-mips+bounces-9516-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F21AEAA51
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 01:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6733568185
	for <lists+linux-mips@lfdr.de>; Thu, 26 Jun 2025 23:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D222288F9;
	Thu, 26 Jun 2025 23:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktnzspxm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B775B2264B4
	for <linux-mips@vger.kernel.org>; Thu, 26 Jun 2025 23:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979720; cv=none; b=Lx6GpEcUIwb7ACGGmXFu/aEX/wzfoBEcdZHlqConNewqLAobiTABfrXC4NeiKldRSuFxTMD7wpjcLyMy29Try7kE0HG75iq4IXziDskp0FrDLA7BSUR7fd0pKt9xyJmbADyKh1C7u6Jt+zBijM53Rol2y2HQ4AgI2Q9wIBvCRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979720; c=relaxed/simple;
	bh=vW15Jg4ggX9gIZnwDizIV0mWZcRQyLuyRNHdO55b2Kg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=C2XVK7SAkUelYWZT0WG/CIp2tkrge4T6l4/MsUAEFFkvb7NYVNLtXVavTVfRDCu2VZAXJG7BF1PpBZbHMjLeBeKu6Uzcy0v/vJ4k4Q6JtKnL9pG94gCyjD0neJVJdI8uwBUhafRw8sP3foF+NMJzIjIw181IJYiPQ47NKQWyH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktnzspxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QIs3mg018890
	for <linux-mips@vger.kernel.org>; Thu, 26 Jun 2025 23:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/H0Qgqe8Ttzr2u9kRhRfs75EuPnlrJgM/cVTTvn1kM=; b=ktnzspxmAA6ZEndD
	OGt5QqK6dizC9ot5Yo2VIBXMQnNmkWOqulXMADMg3YQvVOBcsE8iqPzynOU1P4a2
	EHQZgV+yKf+0cvFa7cxPZ40cK5CnFJNLoR4Ng5ra2ROqM03TeXtDytopLLHfeUr7
	SMXq6+f1HISuM0SEG0mazodDIlGpGdaOQlRSNiuTPAKL1o30OBpj5Vp3TJGYDgyL
	cn9gXJMqP8n421Thmm34Q9+EhyNS0LECXmVYOuhFvjdGrAlSVIF0m+ZcYw7zhBy+
	R0SvmkGE6lzLrrTX9XEIeX1a05niQTJKGUYXWJAL36qe9EfRPyxrL+K/ECdfhtjY
	/DuvQA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7tdestn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 26 Jun 2025 23:15:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234a102faa3so11635305ad.0
        for <linux-mips@vger.kernel.org>; Thu, 26 Jun 2025 16:15:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979710; x=1751584510;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/H0Qgqe8Ttzr2u9kRhRfs75EuPnlrJgM/cVTTvn1kM=;
        b=oVDFSLm8Zuw/C1XGIIyS0IZR38mh6OAioqOXZgLGIM5hawGaWKxNBwvg/dq6lYDw8R
         VN3vgQZhfhqpVEJ2d9FdfcSX5pA/q3HCFCdl2cTDgJea2k1XyVHVjfHtChNDXZ/MV6ot
         wVUa3wJJmYUhCli/pFd9Ou9FmQZpxZfF/1CjIKJMo+BoQ9WlMxzfFJxxWgLoOlZObKYh
         VJs/MYIYJA4rNQW7AMjojQdNifw4POyUd22JSBKVz9SitAuSqwYNBP3kgbmrTW7xSMNs
         9NGVJICbtIVsPFc8GphZff48weaGtBT8l5iOS/AGZQpceh7Bz+qSGhNNizbPxJA2P6hZ
         Aq9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfZf1OSDsi2tQJRUTVskXGndf5s56j/DigZpgtglGVsGWXl0beUu0wIRHEf2gS5T6XYq1+Wc8LqJu0@vger.kernel.org
X-Gm-Message-State: AOJu0Yys084X6Ml9nWbUTK9gO7IlvJTiiYx/S/IKOm0zBO5AIdQCzmiC
	66uQvfCrMg5FlBf0N39RuZ5NiTgXy0rIuVO0M9Sp587RygoF9xEW/x+PFUPsyVWk9tdQ+Vy9xmR
	Q4O0oOm21KZ+uQfdPF3T8tY3IjMHg3ptLnGs+AjcnwbTvhTu4c+MG64UVh8Ii0TvL
X-Gm-Gg: ASbGncvXxYFT4UGNZveKaOmbvb/7S2F6NylYLLLZorSjjah+CapR0Ioy0yZjkBWFsA1
	+NC/gOhA+Hnfr1r52uhxepzOVO4odS4GK+iat9ca4mw0dPB1t4lDdD+mLJWTHDW+29nN+9rwG4Z
	qCmbys8jguwNwcHLLC4CEX08RD5W5cjS2Fl897v4U0ACxBNBuajcKXQ7HJDxvqIHGKi8X0C4Cnu
	qwi2w6ztzZ0RwP+kXnGt6v3oy6bz5NTFwaT4+CL5rLLZCtTYelj7foiNOmYYoLoJ/Lx4WeB8coi
	WAkXXWy9KeVbnwN2oV1OvuKxiYT1iLeW0MlL+vLFqs15YMRnhP2PX1DKxrk=
X-Received: by 2002:a17:902:c950:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-23ac4892b49mr13020735ad.53.1750979710318;
        Thu, 26 Jun 2025 16:15:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkESQ640EkWWC8nNRcJBp88S/Bs4Yykcr1wceJ0RysJiVGp4qVVD1GJLszezOxPjlkSG5Fnw==
X-Received: by 2002:a17:902:c950:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-23ac4892b49mr13020155ad.53.1750979709822;
        Thu, 26 Jun 2025 16:15:09 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:09 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, nbd@nbd.name,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
In-Reply-To: <20250609030851.17739-1-rosenp@gmail.com>
References: <20250609030851.17739-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCHv5 0/5] wifi: ath9k: add ahb OF support
Message-Id: <175097970896.153431.14153254117038791906.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:08 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685dd485 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=aMoWnUFRsw3tUzfFL3sA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX2ZAxVvBAtfN3
 Q7UL8OsKC/gbJXkIAztpYM2jazRr07f7E44zv5Nf9rDniFarlgXSNx/YrIMDarnoZfHVv+WDdkd
 h3kha/lcusKS8yuTCloVhd5OZTqfXDiu0GwaldMkDcPem9JjZbRWEafOv7VvzdJzmudsvYi0LQg
 pIlymHJebjUORjJ4oOt/DFCY1fWsJZXhQJJpd/trFkt3tyDdHkFvzm9Y9mo+uW4jc0Io6DlZP/r
 tcYBucOn3PCL0GVGE4ckZseRivMlycUnjq5wlc0JN+aIci7rZKKlbLI9lMH3XzYR1XzcA6CN6La
 KvjXo9J8K+m6lh3fJPS+yo5Zx6+mUYKcJvi4i/Ym4Ljtw4f4JqKcQb+iopaYqI1uyYrxw9td4Dy
 lEMREH6gwMTjU7UGTWE67KX20cYyFPH39xQWSGMKbTN3RxBiE2ujFvCC1g+8NKlAQckK8myy
X-Proofpoint-GUID: 7OkM0orbtFpHY4dlid2Qy2_hsSm7pP3Q
X-Proofpoint-ORIG-GUID: 7OkM0orbtFpHY4dlid2Qy2_hsSm7pP3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=698 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260200


On Sun, 08 Jun 2025 20:08:46 -0700, Rosen Penev wrote:
> First two commits are small cleanups to make the changes of the third
> simpler. The fourth actually adds dts definitions to use ahb.
> 
> v2: Add documentation, use kernel_ulong_t, and of_device_get_match_data
> v3: Use qcom prefix and wifi suffix as in other ath drivers.
> v4: fix up dts example in Documentation
> v5: move back to using qca prefix. It makes no sense to diverge between
> all the other drivers for MIPS based qualcomm devices. qcom as a prefix
> is used for Quallcomm's ARM(64) stuff.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath9k: ahb: reorder declarations
      commit: 5cbfef9039f61691c87f522f8761d628033bc392
[2/5] wifi: ath9k: ahb: reorder includes
      commit: c8123302c01936d297e22adbd75cad38c5049f92
[3/5] dt-bindings: net: wireless: ath9k: add WIFI bindings
      commit: f902f2c39a807382353b4c6b8d8d4ac1f03aade9
[4/5] wifi: ath9k: ahb: replace id_table with of
      commit: 2fa490c0d7591918bed267059700f1c9e505e881

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


