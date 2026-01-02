Return-Path: <linux-mips+bounces-12707-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6882FCEEB75
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 15:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56816300C5CC
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 14:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AE031076D;
	Fri,  2 Jan 2026 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pQZjxdWu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeMz5fRP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811252EC0A1
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362406; cv=none; b=WyXpDAwqrKRBlkR/BqXH+xrgEulJQtecrPmCcH2OKNifIY//c8NM5tmGqQF2Mo9hunKeb6qXD1UAU8jhRuoEQNBMiPQm7jWqJzj+qLJlA5kvR2FXeiT1OfBrTvHRJubKhsQNMMZzn1wguzqQdQRB8nUoT7cn71dv6c7M7kagHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362406; c=relaxed/simple;
	bh=ELgVrFfch8jx4zNgF23g7jzrBonp6d6Eq/cHi+wq2/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=boZcPYXMDqo++MSOOLb0VLUBcQgSxo7OpqBc6uLv1IbyKSJPzwZZZP2po3WFAk/xuG6XpGd2aRaxP2sZVMchmGAiMA5312dMxLl9wLXhtMpZ8hkMNd/qbffHY4VjqvU5IQ+FaU0CqmoilLlIrRnCYbYiOTjb279JJ3OP1BBlgIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pQZjxdWu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeMz5fRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W3kf784546
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 14:00:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=; b=pQZjxdWu146rz+Ln
	wuEZ+TCxIwl//TICA4OB9Agfc5KjyaBO4Drs1tF7fJmgmnyyDzye7dgTtPIC9rdq
	1QFZfBeidguqVdKffIcb4wcbfUl/ztF5N/+2FqpRLQEsl7wuEe+WbOdEl4M9CXpH
	UDffpQNRqkEPUmPofSE2jY8U9uBNNCshP1x1f+NYdNA3BaiMyGxfXkFN5/AYqxCH
	OUOCEtymcAH8Tgz/KFq3oKiTJL3zw40Fx1v558dDqRFOMKhyvwuX5DqbPPaPJxOp
	h7mAodYiwpP25mTBVszDgmZ2Dgx/8lcmz1qP7lsHhiGlA/jYHwyjsWfjy1DVsW72
	XnJAaw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd7vtkhk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 14:00:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1e17aa706so72771291cf.2
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 06:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362402; x=1767967202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=YeMz5fRPNOcnA8rgnVPeVXLCq+j+K0xjE1L6jCrTV4eOELeZ11QR2PDt0YFrbU9Mwx
         2dDKof73aFFlvMLEvNymocdk+PuaDNm/di7HFnuvPDnxEPr2Uf3cCo5USEXm2VjiP4FA
         qarSy6pLBjohFYpLd59tbNILUZR/n6Mv+FCsTfDytYvO+nZHzSUB6Q1PfDgUy8WVZZKn
         ioL90i019Km7k5Y8lj87OiObI5vHArFzL8gKHerCgfWw3PRNa9epeNKBgbxcuMyuGRC5
         yUHrvqLzWUT+6hNe5JoxiLscjgAuOZproxLhf7ahkEbJP9+EZzhLfirtYTBfQajfwfVq
         mRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362402; x=1767967202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x03N+1nkxwtdppRPIJ+rN+xH+oPAXikV45X3MjLLm/U=;
        b=ZnN/9Q0XGnuaUWjMJ/hMy2pXWz2fXb4hpK1C8kTKVjwD125RDuaS0zdgTQbED8lrFe
         rdpUXeR3oamhK7OOFumMXmvdsMBM9FSJ4boLDuau93PEGAYAddAQIMOg1KIX6pWLCEly
         k26I5LGRIlR+LeIyDDzZzFZuKUX+pWa0x1ZEqwYUplnSOl9lGGnlWIKOr30vbsK3dXCS
         QAeYejtf8c90zOq/Oe4InRQpYjgzzqCPA/xUgiXOu4peDJbNjkQ/hR7L7QmH3M8N27ZO
         vBMtAMnTIaSchP5nC7xuy01X+itHSn9bfcgQOcuaDY6cNjmE6gybbsMKK6kbUb6iiB24
         qtaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwQGv0+lwwU0nSYPW0lHc1A5A5CwP3SDN4hS/su3msX/VOXcGT1UY0nJ6/y6slNZNqqf4fezMpER+U@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkly5FtvUUjBFfukYzDoY25JSw3RiD8McxhkZJcJ5sM/f25gT
	5PwiPS6dcl6pCwAjUr2NUOsmERbnjJCMdWU48M+8yMdH070KGynwuWEIDkDMg3MoNU5Fc/jFP2j
	egtsfbEK7pWAMHeT8B1J/lX1bKsjL4h5+R0f0zDYBpz3ioopeP9noCMrmHDIKe1pl
X-Gm-Gg: AY/fxX7f+mRMosH0MQPYIBbB5DzQfH/Jgzyg6Cc2ffOK/RTIELLpgSxhunsUUqDwtd/
	e30TL51h1pXGH4uJkkAL0w8kbSSg3++47cqKIjuCxp1uYI7h6cQ7j7QdTjI8Zp+B67y6UoIsQHS
	QcUU5o1vB39zMryBTSemg2pL8tKYJxRJ2PKeCK2i/jUpednbgPNRxTR/ho73f6tS17Q83l/daIu
	zdNovf2ZyNNXjvc6rUSRmfKrMm19a3X8hS5mQPJyzDwKlTaYscnARUCV0h8S/BUxOxWccVc0PlK
	B+0idgkrjGODznxmqmN8mmBjF43MDbotcKK3ZVWB7ectOZIbOltobLD1Q8OTrrRLrb5h5GifHMG
	W5TAx572LGAKeuRamf4kLQt+On5ZSWp+rhikYbpMfLOHMfRd80Qe0OIZpA17Ps8FdRA==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910411cf.7.1767362402387;
        Fri, 02 Jan 2026 06:00:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBkOKZSWRFsB6BJFVbH93340vfDP9YfJ3KoJRojpfsiJwEKriedd/ViwC+9G4nwS5XjYG7SQ==
X-Received: by 2002:ac8:598f:0:b0:4f1:dffa:7834 with SMTP id d75a77b69052e-4f4abd7613dmr434910091cf.7.1767362401838;
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm43735803a12.8.2026.01.02.05.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:00:01 -0800 (PST)
Message-ID: <22121c9e-1cb6-4948-93d3-6e9f9d7922b8@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 14:59:57 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil
 <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NMbYOk6g c=1 sm=1 tr=0 ts=6957cf63 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 9P1OV9C8VYB9DeK-hY-E9V1YeauRd_QK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyMiBTYWx0ZWRfXxiu0xbgKZfth
 YID91Xe/fEpMMB43rC387zZQa+xSvyQL+K1jlKY9HWzH40/gCx/9x8Qy34WhLQjDhFqgm99C1HH
 XyaiJaLEFhs4KhoF61YtkpSMmC/E55HzxKw2ccSzdcBithqIbtnccIATSOYj9qecZjfECrhf6+b
 Er5QEI3X9qMdLOgitWTs+A4JKSLzL+wznSc39aT9lLq76WfK0CFIUlE0oarg3UoVhHK8oe/noAw
 YrUyqCiSYo5OqMf3wvhXlRvRszQJdzEppo6tphMqMDqpUMf5+pGvjzNW4gygxEVU0RYUL1i+aij
 tDHaxkoZIQ33FlIIfeG0v0W/r0g52nX42kOUW9kzHBVe9mhPvNubNLIvKBUPHg+bwI11KpvXZm9
 p0vHjwH0XmPvMULv8UAiYop5XQeMjJEONKXRf/+seK+QFT72zBfjVYhyrDmZgJFB6vyYGWDfShl
 mHrfz3j8YDwR1QtUo5g==
X-Proofpoint-GUID: 9P1OV9C8VYB9DeK-hY-E9V1YeauRd_QK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020122

On 1/2/26 1:49 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

