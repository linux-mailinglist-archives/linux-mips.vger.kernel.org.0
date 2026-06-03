Return-Path: <linux-mips+bounces-14869-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3CZGO2pVIGpX1QAAu9opvQ
	(envelope-from <linux-mips+bounces-14869-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 18:25:14 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD3639B2D
	for <lists+linux-mips@lfdr.de>; Wed, 03 Jun 2026 18:25:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=oracle.com header.s=corp-2025-04-25 header.b=niZMKySv;
	dkim=pass header.d=oracle.onmicrosoft.com header.s=selector2-oracle-onmicrosoft-com header.b="H5EsW/dA";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14869-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14869-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=oracle.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A0447318A908
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jun 2026 15:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881473CE4A2;
	Wed,  3 Jun 2026 15:37:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4143CF671;
	Wed,  3 Jun 2026 15:37:09 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501031; cv=fail; b=LRUXmNL+9XFd9WRGbxkI+LzAbOjRMSZzyaEs+4gyKtN0n7VlM3yXTAj1DqApPP78X0sER7/kco+IM9OfkXj6ga7iWphbanUDEQc5kz6wJulgijzkhBmcydhZIniuw10exiW6MV6BvN8g+kzlhbzG0zd+jgTRFJLoVmM26wr24Lk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501031; c=relaxed/simple;
	bh=iKrgO1u9AcYZ2gM7a8c3ajBwq5I2pbw4SchnP/ObdPg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PW7BHDLeovHYfoY/qMDSpjcxDygbUDK8Z4r/RnKOzihGgVYb89p7dvkz3ZwQhz68pIfBWaC6ZiOAGE8EVnlV80ersemJ9cjiQNWX2Ou60xGDXZwHDuXfrD67Me5RajSjUqbCVjLGYTMWp+5ouK2RhMBHb5bchaZvZ4Y+FgAM7t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=niZMKySv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=H5EsW/dA; arc=fail smtp.client-ip=205.220.177.32
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653F7TsI1188768;
	Wed, 3 Jun 2026 15:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=bnPNcoFBRsvUiw+chf5t2WIjaGxo5fpEFT8z99hN6iQ=; b=
	niZMKySv84cNcNvXzzvk/830EDiWhdlI35OKvTUZKHqhOj+8qNdqjwBYaaCjt1+s
	EWdHsOQRzoxanArqzfAWvXuyPiWDR0ltXKIBedBzkl1jpEJVossJu5Slhvux8xmB
	I6T1Aoa/HRLVC7a1HkYrVgTJFV4Jq/Y3UerqNHwGn3jrb9j9+dWODqOZKwls/yH/
	EErG7F3SY1Fi2xPfjMYYgmBQpJqAra8uc2m9Q4QMGiG039Rp2xhpY1txVCB+WS76
	GSw3tZ2G/j+LW+pP4jZ2+mqyaqsUCfLzuwPxyciKbd9YtN/4wOMX1MM2qErBhkST
	0Dbg9wdu3A7DBrNyfr5xUw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4efpaaxga3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Jun 2026 15:36:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 653FZJXr019058;
	Wed, 3 Jun 2026 15:36:29 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4efpbsnwke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 03 Jun 2026 15:36:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6BhHq1Z2zBWHMb2bSO9LwDcWujn0v+cUnM23dVyHs+vbM02/UUaqrvA/aYLGWvBkmT6/09A+yF0Y4CQjfTsrnTTXBxGuRBEhKv85aFYIE5KrwR8kv0TmMqrTavY6JT3WtWP+Up/tHm+QqNG0Sw9CxMSXjJSpL4h3uVomvTLb67v1WJcvFJx911qo5PqNC0I2w9oC1vwpjt6/DZRWV54zi++TnB20GF3n11R2kxYPqz0hk4o8zOI4ZzoPjM0FkJqMJhJk2w4QO1od6cBAYAb1unn2AHxfWBQKJXzJ4hGhdoU8kqFFk6ZioJb/2q4lzsVCgf4lZDS7Nkyo4HjvJ9QMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnPNcoFBRsvUiw+chf5t2WIjaGxo5fpEFT8z99hN6iQ=;
 b=mMZAjtx2kwOMWtAzB6wcSWHH6AQLXVCGcRf2wg54R4DL22UlcD49kggwzBvDsF6FKAJgpfuCXq+OSKXqYuimpt8Cpv3pxF4GRRu6ctWCHSY8slhYZGyqhMtgmQj1y74LAJSl1aWWPUiL+XY3c6fTjBSv3cpNmf7T3ukaREXbF/gqa1r8Me9pWmVCrDeDfE3DI5i2dPpyle+1O38gBleyuDkof464it6VJ72lUElZtX01iggKfWK/3qpqTvoAEQ+V0pGr8O6NZNCr0FWy4JX81puSNqm6s2sUFoPWOTG86nKvYCXoiozLIKJxaJAr/0H5lTVH7hst7Wfk0vcbYA36kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnPNcoFBRsvUiw+chf5t2WIjaGxo5fpEFT8z99hN6iQ=;
 b=H5EsW/dAPYx0roP271RCUiiNEpRitUw7AjHL5O2fQ3mAa/H7NsyAp7mdVzbnzFEVAqCppGrmezmH1nJKHDPE8m5dfmr5SOw0IK4p1Gh6JKP1bIbMTdD3fYvlxUH285TwA8/+HXOGYRw2WmCL+/Y0HNBNSBNxOjgQwBNzft2THWs=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by CO1PR10MB4739.namprd10.prod.outlook.com
 (2603:10b6:303:96::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:36:22 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::9da2:46fe:4d63:a74b]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::9da2:46fe:4d63:a74b%7]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:36:21 +0000
Message-ID: <ff3229e1-94ec-4cb8-8597-0cd978dc158e@oracle.com>
Date: Wed, 3 Jun 2026 16:36:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: core: Remove remaining references to the pktcdvd
 driver
To: Catalin Iacob <iacobcatalin@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jens Axboe <axboe@kernel.dk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20260530-remove-pktcdvd-references-v1-1-aa56941d4315@gmail.com>
 <20260603-remove-pktcdvd-references-v2-1-c4402154d53a@gmail.com>
Content-Language: en-US
From: John Garry <john.g.garry@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20260603-remove-pktcdvd-references-v2-1-c4402154d53a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::19) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|CO1PR10MB4739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a84dc33-5ae3-44c7-e3ac-08dec185dd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XithDC6MKkvLeTLP2wIpGkuGIViQ9NIypjfdfa+SOE5pHY/mtYzT376e0AixzKvLdU3nBef38miQOKOw11gZQ0KEmJZ4bK1Zj930tcXNoXlCaToA3zgSgtSuzjAHb4KMezNjYphRBeluKTV5S31wq/H8tZiwxlbd8ga/aeCd8mm2rSpPnuWO3RJqqwivt/nWqj6+38w2mFsi0vfPhDfTSa/Q6Y34S7cvWZrSYFHYprpxb3towtGVF9VlLoyX+X/0IxXoaq8kBrULES3dIdaIfT2QaRhudYbHWlOU0PW5lnuErgfFr688/N216jw8j57k3xQLQ4x0HsNXFmX322dpGUc5Gx15eDNb5Uv9NjEVfdPq0hLzuBxJJpLWOuiHQvHRtBwo8qTbgeBP26PiikD/t2dSu6UTe+ZvPlmKRnzbw1PoQEBfWw3KNM0GypAUHv/ttPP/CZFKfEY697+ValLnZ7JBPVB57PYdn+RZl/nPh6v6nATbkRHVPnyYw56kvQAubTr810zqmvkoNmahYKiKddDaWOOKVKOOeBMDMhG0BlXLnUeAXY4ol7mU9KL0OPkOIGWCbchh5PqL7O0RB2g7kh8JAB1r0QMWbvn2L0rFEJ6KjE7AHByj+uGysnbk2ippL92tyd1DuAs5SLLcCnEUPJe1PPaOmMCj4kXXS10hdpTbtTFYvrx+c0X19vtUO+kE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFEAFA21C69.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVo0QXFUVVVUd2NqNWNsZ25pU0NHSXVtanFVS3dtOVc2ckcrQUlUS3VDaFFn?=
 =?utf-8?B?R0I3UDlVQ0lOTTRCb0FMTDBiMGoybGVuUncxNFB5TzdWL2h6MXlTZzAvdi85?=
 =?utf-8?B?WDdUa1hPS25XZTU0MGVkcGdpckdRb2V1UmEzQ2dlQWxmd3BwYy95K3JsR2JE?=
 =?utf-8?B?NUN3eEpYMDVPbGZDa0RPRW9xVm04UkxtMHM0aktHaGxSY0orNzRmcXorUE5h?=
 =?utf-8?B?V0xzUEFobDBKdFpSNVpLd1UwN3E4ZzhPQ05Vejl3VmdOQktMUzFKeXUzZW93?=
 =?utf-8?B?aWVBN0hOOWJHRUd6M20walI1QTk0dWN6NENNckl3Z3M2SlozYURkMm1yMHJ0?=
 =?utf-8?B?K3N5b0MzWWFhOFowUnl0L3JKUWFNbUlhT2ZYc3NFYmNpdkZUeFFmK21UOE1i?=
 =?utf-8?B?SXFjeDFYRGpXb3djYkw4NFFoMTdIRGpqZE1kOGJMZzkweUlMQm5wNTQ1WlFt?=
 =?utf-8?B?NGhGeDQxV2JFcExUQzlwOXpuZVlJYWprY1YvZlZxL2hyTXA2Rno3MlJ6ZnlF?=
 =?utf-8?B?bUI4RDB0Zzczbnc0Z094Y3I4OGtNMHlBdWVSZTZMVWcrZS9TZGQreml5ODgx?=
 =?utf-8?B?LzE0Q0kwTzBIRG1icTVlQ1Y4SzFrNEl3dUt6ZjlkdGt1NzE3U3I4NFM0NWN0?=
 =?utf-8?B?Q0Q3c3NDWVpKNHdVTHMxWWx0RSsraEtNcjJXRW5yL0J2Z3k1ZzFuTEdJVzVy?=
 =?utf-8?B?MEJUU0NpRVk4dzd6R2hqYmlZc3JONFY4dlZVT1lkMForWk9oekFiVzdjRVp6?=
 =?utf-8?B?UDlvQytIUnYwQ0pCUk9sNDl6V1dDZHAyYTA5MkJWQUNtNFg5Vmc0a2tXeTFk?=
 =?utf-8?B?VHRaMmhxWEJIYmNYRnhZZUx5QTFxSzBIUVI3VzhYK25hT0NCa2owWlpoUkxX?=
 =?utf-8?B?YTZ0V0Q5Ny9hMVB3NDNWWENlTnlpOHBnMGNydUI3RWVNcUFlcTBMTjdDMis2?=
 =?utf-8?B?cytCYzFxM2s3Vnh0bWxNbWxnMmZZUmUzYXFnZ2FEL1ZBNlN1eW9neDgwMTZx?=
 =?utf-8?B?SGJPWmtaUmEweUo2aWU5aWpYeStxdDZ5K1JTOFM1aTBxbkRQZ0ZOZG10L0c4?=
 =?utf-8?B?QloxdG9kRDZPN2dqMnBTbFRKQUt3eUVGUUgvQVQ0WDJIVWd2VmZWWUFLLzRN?=
 =?utf-8?B?WE04OWJ6NVJCVjBWQWRjdU9YVXVRNzkweGlxYWtCQWplcFU4dTdDeHpVNjlm?=
 =?utf-8?B?bU5ZcDFvRDhVSlE3TndBNlV3b0g4RkNYbmhHWkdVZk4zSXdTd0lsNUY2VE1F?=
 =?utf-8?B?Q3o1WUdUeDVSQUxBVVBpVUJEWjJrcTZiVGErd2U4RTdaRTdxNEx4VWIxNjlq?=
 =?utf-8?B?THJpdmxjRzh1RXdoUGRRNGFqQUlDUVVmcHBtZU5kYVFlVjlpOERmK0h6bmFJ?=
 =?utf-8?B?TEJDazJmZG5tSks2U0l2RUxEV2RNN1cySnlHV3h4Qk1ycXJ0VUM3aUFTQ1pM?=
 =?utf-8?B?WDU0Y252UytwTlR5bGdpRklHWGNGT0RqS0xFY2FoSlhzL2xyaFgxajlyTzM1?=
 =?utf-8?B?U3M0YS9PY011VnJpNXZKdFZ5dk1YK2haenBnSU11QXhtcnZGejNNSFNJRkJD?=
 =?utf-8?B?VjhHSjF3Mmxib3pzeDYrTDl0WG1jN29mK0xDZmMxNkJDWVFnMXN1dkNXYVd3?=
 =?utf-8?B?dHRUUTYvUWtIcWlVYytNS2MwOUs0RXliOHFNQVUxYVRzTUU1eHhLamF4T0w0?=
 =?utf-8?B?Ri9hQ1RlNGN6Ly9YNmgwSGRlL1hBMEFTVHRjR1pMUCtCakhSVVpHWEYrb21J?=
 =?utf-8?B?S3lUclpQTmYyak04cWwwM291cWlWdU5PZ0dZVSt6czM0eHd3QTVFdmdtM1k0?=
 =?utf-8?B?YkNwTkpNenJBNHBkL3pSTXRnakZyNUF2Q0xqUXRlaTZ0T0QxOS9wcUJoeVhp?=
 =?utf-8?B?czlRMFQycGEySDhFTFF0Ky8zd0k5TnBXbGhnUHFzVW93cXA4ejRnM2ZHTWVI?=
 =?utf-8?B?c3lzMXNnYWdsZERLUlYvZUxHZ0FVS0N4OEhIZ1Q4cHJYMVcyY3dnajNkNjBo?=
 =?utf-8?B?anI2K05HOXU1RTV6V1YrYVJTZyt0Q3ZyMWUveGlTbXE0L2RYRWVTb2dHdTlj?=
 =?utf-8?B?RTVCekZPUTBHQ2VBb3VkZVVqZHo3dmRPRHVTaTIvQWF4UDQ5RG4zaEdMRHp0?=
 =?utf-8?B?bTE2eS9tQjdvYy9ZOUdEM1NTSllhaWl1VGVDc0Z2T3RQbXovYTV1N2pWVUNo?=
 =?utf-8?B?OExxSmlJa0VwZEs5blBEaGR0V3NxblhXQlZUTThFVkNQYVQ5OS9aOVA2STJ0?=
 =?utf-8?B?d2RaMUR6cmV6bmpWNjVKTFZmb2FyYm9XODN2V3BtZEdyNW9JazR2endCbS9P?=
 =?utf-8?B?RmdLS0lqbmZsSWZZSWVlaU5GMFIrQmlpbVkxNU94aW9iS0VIUlBydz09?=
X-Exchange-RoutingPolicyChecked:
	Dz5Cpp3G1PQBjBaq6QjF3dLz++da495bUM7KB2YQ8E5thuLMi0i/ZTLYEZT3gwqVcrtH66XZCdtpHmuzMAiKKEaJ0OJ0pXkRVzKVPq2osNtaEc1bIZQCuteaiwvCWf7nSXwFOcEbLxb5RMpPqCmvW/mCgO6vh0IGDisJ3CMg8vJnELmJHAltILGUfz302rHC+Ie1SbJGaEtJ8zwaxCy4emq70zqx1Xrabt3u54XuCDc0iEe17yj5wLK6qMMCZx8BYVtB2caDh8FmLnhTmhT+TVRsxdFYJlG7u4f4zWKxpI0EEyt/YI2WDI3+GqemBT94gncPWg+/5jIzIUGmfaZo4Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AJbdf6ZoJzFcoHTJ2oiOQU4nVl0SvqcDAQJM4sjB35hfUBIB8hkLgsW4bhjiQk8yIWCbQNjry+CrntEdp95HEpkVW8N62FXznWKJad0Tvgxk5m6TduIbVNQ9ZmtkmoOXeTza+SG4+L4G2fH8LNNdWQvwqJPHsbBBFDACjf5jWCfl4/aQ6+8Qo2QA+aptU8/JUVJcWu/AWX/PT630tVAKbotPDr3TZHYNSIcxoKY/N0fWggariToCsrYXfCKJBbvTtopdofVI2TafW17mZM39IihCEpoBL77cvOv7qkaLZhN9m2cUHTGdhumB5QDp/RryXscYs29kkSrgznHD+O4jn2Y/xpruW5t7gL09YEZe+zQ309XCPncR8d7D6AIdq7jcDbGGSlVWgsJcq2GBbDPj1FtrdC5qoM/1f4ICChraIybvU46iWxyt5Nky6n3j7bIhVdkZCnZKwiwt2o/SsyH/qcgeeKP2HlNQnZQlzVuSNpdDrJ+sZ4qNnmwk+moEumwHhlke+/B1gA3cf1cvZoMbuhyp/2XLxdI9jUa/+R28InxzOWNhYdMmv7DD4Ah8Ba0v7KXtEkmbNmIOkGbUgRilcyubOaKW1U6qmQUYDU0j/6E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a84dc33-5ae3-44c7-e3ac-08dec185dd0b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:36:21.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQUyVVJlGgaapW7ePXkBsO3z4XaF67nURzjmfWrxmGXCLExSlApCfrZsOfUoFD1vPm8JWEyjpvbOEwe4cu9Kgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4739
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606030150
X-Authority-Analysis: v=2.4 cv=T/S8ifKQ c=1 sm=1 tr=0 ts=6a2049fe b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=bC-a23v3AAAA:8
 a=pGLkceISAAAA:8 a=YM9pCLempioJBWB_ZgsA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:13714
X-Proofpoint-ORIG-GUID: 9rvYy_GbkDTemNg5t4PLRhm3of3mg9fJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE1MCBTYWx0ZWRfX6Dgtw6AfMHOQ
 lc4EViNIebnykyvMvHFcUmnEub8j86/haq0gX7B3Sx8vf8gYmMLbjJs4E99YkiiMv7G0g7BRVpt
 yn+22c2UzQ0YpEcvtlwK2laI7QW0RztM/l6/yuCBB8sSPzxi1De35IkKZfbXbYNzpRM/P/oE8Lk
 SnrbZ+J0lsh1bhHBv/fGVjBkgHXHMzf0LuX6X3wex22QgVg+g3QYeKXqiJcgPIRhaB6D1Bbd+N5
 PVd1xXcDPR/VlMkAeIiIJlfVQZrrN6bACUrnxByA/e624fIEsBrHp6yQyASJcqWU4pWIp8lD8Jy
 Tn5+M9JiUPO57L0dCQ67ENolW+3AhxKENPqebQb6SCIzWDkgHBMI/7huf0CyePR10YO6JLxRSvF
 2y3DL8nAaso0GAB439xw4UHkfDz5UtXXhfaLydH7lEfSN3PwHNf0dBV3MQ1Ec5U2QRgtvV5AMZV
 NfnPCeiUSC2On2s3GMVnAkRfzH9x9pFyPg6btXp8=
X-Proofpoint-GUID: 9rvYy_GbkDTemNg5t4PLRhm3of3mg9fJ
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:iacobcatalin@gmail.com,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14869-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,HansenPartnership.com,oracle.com,kernel.dk];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[john.g.garry@oracle.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oracle.com:mid,oracle.com:from_mime,oracle.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.g.garry@oracle.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1AD3639B2D

On 03/06/2026 14:27, Catalin Iacob wrote:
> Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind some
> CONFIG_CONFIG_CDROM_PKTCDVD* references in defconfigs and around an
> export. Remove them.
> 
> Signed-off-by: Catalin Iacob<iacobcatalin@gmail.com>
> ---
> Found this incidentally while looking at kernel sources to understand
> what pktcdvd is
> ---
> Changes in v2:
> - Reworded commit message on John Paul Adrian's suggestion to be about
>    the removed references not the export symbol
> - Link to v1:https://patch.msgid.link/20260530-remove-pktcdvd-references-v1-1- 
> aa56941d4315@gmail.com
> ---
>   arch/mips/configs/fuloong2e_defconfig    | 1 -
>   arch/mips/configs/ip22_defconfig         | 1 -
>   arch/mips/configs/ip27_defconfig         | 1 -
>   arch/mips/configs/ip30_defconfig         | 1 -
>   arch/mips/configs/jazz_defconfig         | 1 -
>   arch/mips/configs/malta_defconfig        | 1 -
>   arch/mips/configs/malta_kvm_defconfig    | 1 -
>   arch/mips/configs/maltaup_xpa_defconfig  | 1 -
>   arch/mips/configs/rm200_defconfig        | 1 -
>   arch/mips/configs/sb1250_swarm_defconfig | 1 -
>   arch/powerpc/configs/g5_defconfig        | 1 -
>   arch/powerpc/configs/ppc6xx_defconfig    | 1 -
>   arch/sh/configs/sh2007_defconfig         | 1 -
>   arch/sparc/configs/sparc64_defconfig     | 2 --

Obviously none of the changes above are related to scsi core, so they 
can be made separately

>   drivers/scsi/scsi_lib.c                  | 8 --------
>   15 files changed, 23 deletions(-)
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 85eef401925a..b67f0dc79499 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -2224,14 +2224,6 @@ struct scsi_device *scsi_device_from_queue(struct request_queue *q)
>   
>   	return sdev;
>   }
> -/*
> - * pktcdvd should have been integrated into the SCSI layers, but for historical
> - * reasons like the old IDE driver it isn't.  This export allows it to safely
> - * probe if a given device is a SCSI one and only attach to that.
> - */
> -#ifdef CONFIG_CDROM_PKTCDVD_MODULE
> -EXPORT_SYMBOL_GPL(scsi_device_from_queue);
> -#endif
>   

I also think that the prototype of scsi_device_from_queue can be 
relocated from include/scsi/scsi_device.h to drivers/scsi/scsi_priv.h

>   /**
>    * scsi_block_requests - Utility function used by low-level drivers to prevent


