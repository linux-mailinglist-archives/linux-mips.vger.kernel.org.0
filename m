Return-Path: <linux-mips+bounces-3713-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C277290B598
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 18:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB121C22F38
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2024 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FC714EC40;
	Mon, 17 Jun 2024 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cTTwHyU3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1414F129;
	Mon, 17 Jun 2024 15:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718639407; cv=none; b=hln74/QNXiTn4ixMlf9BxuQOg+ifzqlMwezipEIZ93K1MYafIe1T7fuZP6cQ+3tFiJVWBxkreARQz79kejWBvW3bsVjhwSnHrsctwg7pR6ErZ40dq31rEyXJAqA2KQTAqrSDhiweYogoSGOIUP6f/sjYhJ4L7bjIJTOLa62kTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718639407; c=relaxed/simple;
	bh=ggmEO6kh8N+t27DXxD23LioxVz5/oJATMOXCT+P2PEE=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=i471D6Zn0/te2Mh6Z3x+IX5nJ+L1cW08Rwir2vs+yaC9dqdpL6sCVRAaUkY7jGI9mHPriLCEt2dvGPn+AI/Qc9LWNiqyLBtweMk6biXzcsracMzZp7PujU/SF7A8jFXcOKwSVw+7iMOAWFQ8d8tqIh7/A2EgNa+7ocRwE0BwRzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cTTwHyU3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAxZ1w016060;
	Mon, 17 Jun 2024 15:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ggmEO6kh8N+t27DXxD23Li
	oxVz5/oJATMOXCT+P2PEE=; b=cTTwHyU3M0amrmT5gTcMMEwLh/lW24McHAYwfX
	pAVyCRe5tlzFF8VaWmAb7Oss6RFzJgOkkp6YNxm4BjaeTwN1Toi1rZK7y419ZalX
	OZIQGEOSEiSirYIQNhuIerHTm7ECFbIVAI3WkODf5mKJHOXlwAYekDzSjpPrdfDn
	xRc7PTu1EQR77310FHpmSBO3X/edl6K7CN9xz4N1kexXevAYgeCJXnuN9awDArZ2
	96WdX/hliLpnJ3k6zrD6GtQvvqe5OBCZNv6/7TSpjB09le/UsKF8RhkNv9YECiDj
	hzU0zIklAvBORQ37jfsDLq9vKd1/BI6FuTubm8uEYJyDeXjA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys0nfcd8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 15:50:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HFo2jV023329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 15:50:02 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 08:50:01 -0700
Message-ID: <a138bd58-80b3-4adb-8cbb-65e92a0d0b6e@quicinc.com>
Date: Mon, 17 Jun 2024 08:50:00 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <linux-mips@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: mips allmodconfig build error with llvm-18.1.7-x86_64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k-8u4kh4Y9hnNCzAgPlBbL1SQB7GPM3O
X-Proofpoint-ORIG-GUID: k-8u4kh4Y9hnNCzAgPlBbL1SQB7GPM3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_13,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=450 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170122

As part of my tree-wide cleanup of missing MODULE_DESCRIPTION() macros I'm
trying to do allmodconfig builds for every architecture.

With:
export ARCH=mips
export LLVM=llvm-18.1.7-x86_64/bin/
make distclean
make allmodconfig
make -j$(nproc)

I'm getting build errors like:
Cannot find symbol for section 46: .text.free_initmem.
init/main.o: failed

Cannot find symbol for section 6: .text.copy_from_kernel_nofault_allowed.
mm/maccess.o: failed

Cannot find symbol for section 10: .text.arch_asym_cpu_priority.
kernel/sched/fair.o: failed

Interestingly, if I make 'defconfig' instead of 'allmodconfig' I don't see
this issue.

Any thoughts on how to have a successful mips allmodconfig build?

/jeff


