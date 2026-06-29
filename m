Return-Path: <linux-mips+bounces-15238-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oozjIDnvQWqBwQkAu9opvQ
	(envelope-from <linux-mips+bounces-15238-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 06:06:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D896A6D5CBC
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 06:06:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ibm.com header.s=pp1 header.b=KrbqZAVG;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15238-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15238-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ibm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA97E300D970
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 04:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA6033343B;
	Mon, 29 Jun 2026 04:06:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58AA4A32;
	Mon, 29 Jun 2026 04:06:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782705975; cv=none; b=NV0DZ3rmXLz91u7IybozCTpMH5z4L7WkBhKLVUvIb/3jb5HKHFSUDhavt0mDKZQFrpa1SFDgB3nl66SpRSqkR+GT6xYmubTHRXhFwgrhka0YjAlBKG9NBcHHNhXZph17Mi4QA50vmzGyg+ioMJglIhEsvxBV+Atxjhsb3Z93q3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782705975; c=relaxed/simple;
	bh=AJqshm7FVM3jS9nKHlf1xpTTxoWci5lMRl+Bw+acWtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cXB7h2mbmF8hpmAazVwFQzo/Oq/QUTVllbh2oZNJVOZzqxs6r76Y1SHT+pZ/Jc0p1/1iPSev+m2ZswHou73Jm6y75lSwPGVwmsSyfH8Q9i+L8t60zttlQyHi0DaQb2cw6wxpXbKQcnZzKMdKg/pfSE+l0ftteUCJDooxLeH/hrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=KrbqZAVG; arc=none smtp.client-ip=148.163.158.5
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T3J2TT1992909;
	Mon, 29 Jun 2026 04:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PCbQYq
	ZeLaUUzlcfiFVUrktZlR6kWo7lMTcRNRi7q2k=; b=KrbqZAVGv5B6uDns16vHR5
	jHYCcGKpedVH4h9WJ2KInnslH6uucCZjIKVoh8j365rOmy8oFj3g3aAKLWFjEiwH
	nSWf3pk/A9F1x0GPNUOsFbHQpsgPWZTUKgcGO2U5E26qFdtsvQCmNx9uMF0sxtpq
	qw2ki567kVaHOHPEcuPVvrxa9d/JDXPLCV/S3DtS4Q7KvMFnUoKmKHRnhTeyQ4yx
	DOoRusfsX/PbmvCXLn285Soghgo7e5v9YYQnvF4P+SsMSAdlJP+zHSIY/5lFGrJC
	TMrehriqGAndb5oPZYWWoJooBYnC6dLVM3vonE1SLKGA2F/2CVI9iaSwcCBhRf5Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26req76p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 04:04:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65T3nk2h000729;
	Mon, 29 Jun 2026 04:04:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhy3ged-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 04:04:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65T44gtw49021186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jun 2026 04:04:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B036B20043;
	Mon, 29 Jun 2026 04:04:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D08520040;
	Mon, 29 Jun 2026 04:04:32 +0000 (GMT)
Received: from [9.123.5.233] (unknown [9.123.5.233])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jun 2026 04:04:32 +0000 (GMT)
Message-ID: <e0607dbe-4d55-4aee-8368-25110848bc09@linux.ibm.com>
Date: Mon, 29 Jun 2026 09:34:31 +0530
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] arm64: Add HOTPLUG_PARALLEL support for
 secondary CPUs
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
        will@kernel.org, tsbogend@alpha.franken.de, tglx@kernel.org,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, peterz@infradead.org, kees@kernel.org,
        nathan@kernel.org, linusw@kernel.org, ojeda@kernel.org,
        david.kaplan@amd.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com,
        maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org,
        thuth@redhat.com, menglong8.dong@gmail.com, oupton@kernel.org,
        yeoreum.yun@arm.com, miko.lenczewski@arm.com, broonie@kernel.org,
        kevin.brodsky@arm.com, james.clark@linaro.org,
        yangyicong@hisilicon.com, tabba@google.com, osandov@fb.com,
        arnd@arndb.de, anshuman.khandual@arm.com, david@kernel.org,
        akpm@linux-foundation.org, ljs@kernel.org, dev.jain@arm.com,
        yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
        kprateek.nayak@amd.com, chenl311@chinatelecom.cn,
        thorsten.blum@linux.dev, chang.seok.bae@intel.com,
        tim.c.chen@linux.intel.com, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a41eede cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=UTcEnaM7yftER99u_cAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: brKsWx2Mn5cq22CSo7JfDcXigXZ8mboI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAyOSBTYWx0ZWRfX4wuecVrq54Iy
 09MuLAjOrz4oMF0mdeWXs+yPEw2RHZ5MEGeCZZQ7PFIZ2Q8tULLjM1jh2pAcB5A1x/txgTR5z2H
 QSarFRBtoBx1X2qhnmIT+ORW4AiRaEuNDfc0b5Ms7QwRNXFNSOs5xOZCLmsrFtQlCOJSsAoX0Es
 g3pLBjXT9zh22aSvrbk5nRCiXnLAyJEH3tq/6+hLw/6I6v4mNVjma2epz7cuMgHeoS8KcYkxA2t
 ju97JqZHRkjH1cHpkOUumvZ3ktTgUyRWdrxxvz9qrzkNX9TeQVS+liYC+4JvYJHv2OD/tqOR4iU
 +pnviHtig/I4k8R+j7b+rY1gPdjNP7incw4E2f6UxpQodqFJd16k4/OC0Tn/1+4UEbqkZdSO+1U
 rD6UQ6VzaLh4e3NICIJyfuiE9em7wPlXa/nDZkdlYqSQtkOXAZFGJyK8eoXXC173ga82W2waYLx
 N24t8mv2YzipMjc8t3g==
X-Proofpoint-GUID: r39Yr-mCbX02DwkQlbof5NCflo21fNWH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAyOSBTYWx0ZWRfX0dtp8M6P3xSX
 Km3HXGHO8viEhGwrt2g/J/kRq7WP4XqsyDiGB+S0dVDp2rKp8y4yYwpRenpX7AIhH324AS+c2+J
 ZvjCVjjjFhuPZCJJeyTNN2qdy6LcCWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290029
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15238-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[huawei.com,arm.com,kernel.org,alpha.franken.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,amd.com,gmail.com,linaro.org,hisilicon.com,google.com,fb.com,arndb.de,linux-foundation.org,os.amperecomputing.com,chinatelecom.cn,linux.dev,intel.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:tsbogend@alpha.franken.de,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:peterz@infradead.org,m:kees@kernel.org,m:nathan@kernel.org,m:linusw@kernel.org,m:ojeda@kernel.org,m:david.kaplan@amd.com,m:lukas.bulwahn@redhat.com,m:ryan.roberts@arm.com,m:maz@kernel.org,m:timothy.hayes@arm.com,m:lpieralisi@kernel.org,m:thuth@redhat.com,m:menglong8.dong@gmail.com,m:oupton@kernel.org,m:yeoreum.yun@arm.com,m:miko.lenczewski@arm.com,m:broonie@kernel.org,m:kevin.brodsky@arm.com,m:james.clark@linaro.org,m:yangyicong@hisilicon.com,m:tabba@google.com,m:osandov@fb.com,m:arnd@arndb.de,m:anshuman.khandual@arm.com,m:david@kernel.org,m:akpm@linux-foundation.org,m:ljs@kernel.org,m:dev.jain@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:kprateek.nayak@amd.com,m:chenl311@chinatelecom.cn,m:thorsten.blum@linux.dev,m:chang.seok.bae@intel.com,m:t
 im.c.chen@linux.intel.com,m:x86@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mips@vger.kernel.org,m:menglong8dong@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.ibm.com:mid,linux.ibm.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D896A6D5CBC



On 6/24/26 2:55 PM, Jinjie Ruan wrote:
> Support for parallel secondary CPU bringup is already utilized by x86,
> MIPS, and RISC-V. This patch brings this capability to the arm64
> architecture.
> 
> Introduce CONFIG_HOTPLUG_PARALLEL_SMT to avoid primary SMT threads
> to boot first constraint.
> 
> And add a 'cpu' parameter to update_cpu_boot_status() to allow updating
> the boot status at a per-CPU granularity during parallel bringup.
> 
> Rework the global `secondary_data` and `__early_cpu_boot_status` accessed
> during early boot into per-CPU arrays to allow secondary CPUs to boot
> in parallel.
> 

Shouldn't this be called CONFIG_BRINGUP_PARALLEL instead?
Hotplug usually means disable/enable CPU at runtime.

