Return-Path: <linux-mips+bounces-1598-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 426CC85D013
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 06:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9055AB23F13
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 05:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF38D3A1B8;
	Wed, 21 Feb 2024 05:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pDzL0pw8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB1539AF1;
	Wed, 21 Feb 2024 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708494325; cv=none; b=Pi+d8wFtAoyBI0lQASROEmVXkmXkUuZ4NCwT+9Ls3/Z3DgtkfTG37aAfuKMv4Vq7ropvsKQKFWtXhWeNxVzTlkmMscvZ6Y/+JRj+nBBJg4ly2Sn8xly/L0UB92bzSQwqXDwENVmcH70tnPBrFvbnC2PjPWw2taE0C4qs6bi2a60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708494325; c=relaxed/simple;
	bh=h5mKyikvtkjtjJX/pqzgBTSQZDslyVcAw/thIdZQv4o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H/NhXR/Fvf5UWzZ54fvgHaXwobx6Lw0vpotcWv2T+RmjQI3mFP4owr62QdCP1Ht3FJ75b/u169aGcjPNO61S99Y8GO0I2wILGHNTJKgIxgst2e+PpCTLSL7m5fkbwk7BWjjO39Mc8GMnnVesA3MHIWCYjqYNj9aNA8uqWkIdPvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pDzL0pw8; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41L4lBp6000697;
	Wed, 21 Feb 2024 05:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=b4Rc+JJTl0oXXyFyUimmcRSwrR8o6jLizaEBqMxTzFc=;
 b=pDzL0pw8rbCUMPoiRdCVZyKEnV6ScCiw5RtLJbOPPWJVM6LAN11L5R2EJlD6Ooa0AKiN
 O9CtaJwifSVi/sC7iQPdknvm9UZk1hCvsPSH8fj7dW5JqMplw+pjSA9EtPmLnycFvlxX
 gamkIBeZ3eEbqvuuXKYiGxP3G9aVB66z6dHx8d2+7/E9Jh6pCLKcQgOCHPW09zgm/i05
 w6gkswvr7m5EfyQmrAgs8HIKMuavQoQVaI/IKAQQRoMA97aTek/5NI/VZzvleGpP14Oe
 59YYOXf9/0P94kEfukBAbpOmrS74g6CwFp3B/ufyVvu7q2gp4hZ2r0jVQwCVh67lvO9u Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wdaeuh2gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 05:45:10 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41L5L576027185;
	Wed, 21 Feb 2024 05:45:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wdaeuh2fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 05:45:10 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41L4ZADY003620;
	Wed, 21 Feb 2024 05:45:08 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wb74tndg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 05:45:08 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41L5j5wm20054726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Feb 2024 05:45:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EE7220043;
	Wed, 21 Feb 2024 05:45:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEE3820040;
	Wed, 21 Feb 2024 05:45:01 +0000 (GMT)
Received: from [9.203.115.195] (unknown [9.203.115.195])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Feb 2024 05:45:01 +0000 (GMT)
Message-ID: <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
Date: Wed, 21 Feb 2024 11:15:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up related
 config items
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org,
        x86@kernel.org, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        ebiederm@xmission.com, loongarch@lists.linux.dev,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
        viro@zeniv.linux.org.uk
References: <20240119145241.769622-1-bhe@redhat.com>
 <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
 <Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: o0K0_e5Ni1T52UBm7wfmF8Us0d4xjhAq
X-Proofpoint-ORIG-GUID: JVqEJMNWA1ME-iLPtPQHASXdnQfDLkYD
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402210041

Hi Baoquan,

On 04/02/24 8:56 am, Baoquan He wrote:
>>> Hope Hari and Pingfan can help have a look, see if
>>> it's doable. Now, I make it either have both kexec and crash enabled, or
>>> disable both of them altogether.
>>
>> Sure. I will take a closer look...
> Thanks a lot. Please feel free to post patches to make that, or I can do
> it with your support or suggestion.

Tested your changes and on top of these changes, came up with the below
changes to get it working for powerpc:

 
https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/

Please take a look.

Thanks
Hari

