Return-Path: <linux-mips+bounces-12979-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBP4Cpl4cGktYAAAu9opvQ
	(envelope-from <linux-mips+bounces-12979-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 07:56:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2F952718
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 07:56:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1561A4E6138
	for <lists+linux-mips@lfdr.de>; Wed, 21 Jan 2026 06:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8C66426D2C;
	Wed, 21 Jan 2026 06:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bi1DX3dh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9240D3C1963;
	Wed, 21 Jan 2026 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768978328; cv=fail; b=WTYlreqRXF4+Y706rihvjsE6JwfER728drMKwOzlkxDGgOgg8SnxNR9/6qYRgOua9OQ32NG2VV8v4uyLHHTxHFlNtPaaNSFD7BknImDqgf6MFXmpIO4izOYVYmGvwlsjiVBH5CLnBhbM18LHEOFhfq+8CrAK4T2pTpaJNrmc4zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768978328; c=relaxed/simple;
	bh=Mj1kPc+uGCTSDckDvgohIB803e4z+TW/1bfc2EVrUGc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dxZFMzqeVGUN/QZT2Ol+8pVtNd/TMTJommuBRnhFUGyNbqlQCkgFLmdPg4E3Ec0jAjQFqG5VmbTDjayMC2TTwHnyfL9gfXSFgcBEATmW5U88SEEr6A0IGiSflHChqUq/2O4c7VUPuhDm5Ss725uA84GNvqT74GapN8pyPLViti8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bi1DX3dh; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768978326; x=1800514326;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mj1kPc+uGCTSDckDvgohIB803e4z+TW/1bfc2EVrUGc=;
  b=Bi1DX3dh8h9pZzT54TEWl1SydgrVK9s3WCLpg5vQ2Qa8kGgue+wvpLzD
   vgRBqMBaemkjU4hHZfCqAeH30HelMJama2HxvkucCP6run8JrxqSEsvK0
   Yhvm11IU4Igav+Qnla2dE77alu9PnpuMNJvNSEH/6eCmOM7QsF17lBp2x
   dD5CVFJ3/9MbYdlZufNo5eyVq4vY05xbar2Ll1tiCggGjYnTb38HiD2jT
   V8nlF47lUxOl+043qXHTTDVA8wK0M7+zuq5hXrSMk/M+pPeNZ4MxT6iaS
   2x9SdWc+cuT0UJTIrAJPyjpDO9A3DysKP1lOc1e8MVzRUpybMf/8pu3DI
   w==;
X-CSE-ConnectionGUID: ZF9Ss6IqTeuY+mAy5KGh2A==
X-CSE-MsgGUID: RwvLPY6YQc2iAxz2lCtG3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74067742"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="74067742"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:52:05 -0800
X-CSE-ConnectionGUID: JZ4cYXnOSqir8Ex1aF+Wpw==
X-CSE-MsgGUID: TmUT36OuR1uAiGmrO1CZkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="206419113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 22:52:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:52:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 22:52:05 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 22:52:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcDVkP0VhbAeuAJYOHsTERWri+trD2jWS+OHRDS/fJpxlanZOPdYGCQQ1ffSKgr8qaW/xHQ84tIFJz8xEwx96tNUC4idYUOSoR0bq5rcryIw4FXt+PdvOm4OjXhmmRc7Zzlrqez9GLDdYrt53tIV08+iIb/OLZLV9144dtjfop3NvDp+RlFgnXsETPG6TG8jhzKFxMoaZ0ajzUOI+IKIItHR7zpKO1eyqoY+OnBrWmVnk2bfSFUKP+xOCuwfTb3GTBxhMgaLXkaSYrlsYYDhuopqQo+IYvCU3Kpm1zcXvIij9D/0m9/l0xBwOx59bUuJiQKnr9Skm8MqKZAYPYTr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RomQAB3BSLvcH4BHcjvx890X6WatPlv4J51aazgPtnQ=;
 b=Ol3BIa7pZiKnR6vzKVI9KGbpSez5al4l/fA1d4tHnWX/K3x9/GWqUBGPGkR0NShZ9Mg1lhqDHoh0Svu5Q4y4VjzB3GC8R8ueG1TmDfdy0KRpZHZRt7v8ILgxlMRY8LceIsygSFR2CSLCyNNfvpUgOOkCu/ORINTpRwbjA3xhLeIcLZ3Ms33XyI/3ebCLeiOwUVK/ABkbyW7O92JfQHA5cjQa22RYG7Ilh/vC1VREqhvE9vq+4rc3Y6DNcV34dcxTPEm+08LWCHFXY5JCseaR7NVyN8lPURp0UqlVxMIufZYK5Z8rcrod1YbfoY3pQyDG29WGchwcWR0b1KyQ5ulVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPF10012BF96.namprd11.prod.outlook.com (2603:10b6:f:fc02::a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 06:52:03 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 06:52:02 +0000
Message-ID: <9fce7077-8ac2-4bdc-82a7-48645166a950@intel.com>
Date: Wed, 21 Jan 2026 08:51:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] mmc: sdhci-pic32: update include to use pic32.h
 from platform_data
To: Brian Masney <bmasney@redhat.com>, Thomas Bogendoerfer
	<tsbogend@alpha.franken.de>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-9-927d516b1ff9@redhat.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260112-mips-pic32-header-move-v2-9-927d516b1ff9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPF10012BF96:EE_
X-MS-Office365-Filtering-Correlation-Id: 86238901-17db-42d3-efe0-08de58b99503
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkRGRDErYXFxTlBTL2h6MjVqZy9GaE1YNHNrSmVEdDY3V1Q5aUt2MTBJUmhh?=
 =?utf-8?B?OHRLS0NMQ3RCaVhjSG9CR1Qxem9ZbllFQUpGUm1Qd1JHMjhLQUpCQ3k0Sko5?=
 =?utf-8?B?Vk5rdWcyNHlSWjRhNXpOalNpRkVEUlorakFSUnVqOXVNOFdzZGlOQ1pDNGIv?=
 =?utf-8?B?eUhSTUMvbVFONHhiZk9sR1lMT0R4NXZ0VWZYY2JYNXhQTisrU3kweWVEZzdX?=
 =?utf-8?B?RTVsc3p4NnhTUHY3cURES0dvY0xLMFpMNjNhNHVpcDYxdkhZWDVEUndsNDF1?=
 =?utf-8?B?cWlSZDRHOHN4UExZS2lNSTA1K0JDb3ZFOGVqOFVjSGViV2lLM0p3d2FBNmIz?=
 =?utf-8?B?RlgxTGo4SWp6U3o4NnExQnRGa2JOQVBmUUpFQUwwSTRRaHBMZkhvVU1pcVJs?=
 =?utf-8?B?S3lVeUpGYXFSMzU1RzNkbWJrT0JtRXZVMnU4cTZaVVkzWVNpNmNNaHdEQk9l?=
 =?utf-8?B?aGF5ZlRhVHRNTWYvcVMrazl1YVdkY1NZVUxrd2xoRDhwZGdVZVdKay9qb2d3?=
 =?utf-8?B?ZjZzRGtpNjZYdlA3bk9GZEpwdmVxbUR3UmVOcXE3S2hPamhnWHlEc1ZQRUF3?=
 =?utf-8?B?U1JIMjZTZE0xQmtDcHhHVVBnVlRHQWdmUVBOSHErUjhreGZCcVZWUU1Hakd0?=
 =?utf-8?B?OVNJdTlqcllyUThhRGluTkRjRlg4ZkVhcXArQXlGb2RuUUx0VUwzWlE2eDFU?=
 =?utf-8?B?am10eFZYMkJmUUJ3djZiTlFDSHEyL3dhalIrSlJXcmIxclNHWWt1Uk4xKzVY?=
 =?utf-8?B?N3JOVVp2MjVOV0ErU0tyRDdjUkxWQ1E0d0hieEdxdHF1TzlWZlpVbDdma20r?=
 =?utf-8?B?SHdLYk1RcmE1d0txQk54SXl0T2R1eXI2THlmbWJZQ2VoOUdoRVZWRWRPZE80?=
 =?utf-8?B?L3dxTCt3dkVzT3NENDU0dTNoa0hFS2pKRWgwRWVYb04ydkp1VTgvNHNDN3dH?=
 =?utf-8?B?RGNSRGdYd0ZCaTVxZ3M3WjdQZDFRd0c0OE1NV1VqbDhYMmltYnY0YU1jK0lp?=
 =?utf-8?B?VVhsUTlScWdyUXgzVGNza1lreXNtYmNrWENSYVphZml1dnZxNjZnRFpDMStl?=
 =?utf-8?B?OVpWbHhpNzk0THU0NGxjVFc2cndpQmd1N0FCQkhmSThLS0w4RmpJeHF6Y2NH?=
 =?utf-8?B?aElOV3I3azVOWU5pWk9qYnR3L2ZkMVd6dUJ2NUVPLzEyT25IdnJJUmNLNHhr?=
 =?utf-8?B?UWhrRlFDckpkVmlPQWxYN24vUk5rTkNaOHFLQTN1L1BVcVA5WmcrbnYxbzU3?=
 =?utf-8?B?eG9DdVd4ZklsUmI1NHJjcHBxZ0ZSZGpRaytnOXdaY1JlZk5lZzBhd0JVV3JD?=
 =?utf-8?B?ejB4cDF2U09yN1B4dGVGWWpDTC9oQWZHVWNpYWpNanJmci8rejJvQkNpWjU0?=
 =?utf-8?B?N3B5MWFtUVU0QmRNRThJTnZrb1N4dUhOUERqOW5Ob2hUV1hObEM0d2dJTTNK?=
 =?utf-8?B?UlZHdk5DMENOQnFvOStUZFhFOVB5ZkxYbG5CenA1U0xUdWh5Ry9kOU9BSlZ1?=
 =?utf-8?B?T3VSMzJ6T25kbE5PNmF0cXpvYlM4NlBIZ255OWhJdmo3YUhJOE5CR0l2NWt3?=
 =?utf-8?B?WVY2OFhvZU90eGZzbUJZTlc2QkprRVlicEE2Zy9IdmZvZ0cyU3VXTGNiQTRO?=
 =?utf-8?B?OC9UUHhTYXF1SVM0Sld3MmJiMTN0QVFXdUg5eHVtSGlYNzVzMlNrQ0tHOXNI?=
 =?utf-8?B?ZjE4NkxHNWRKVFF0M1lSaUVGN3RsUzR4SjdNWDdCbkV3V1c1TzBHVmsrc1kz?=
 =?utf-8?B?WW9ydDlxY1lhenczV3ZwQTk1RDNXbXlrZHZySEthdGVtUHlpMzM5T05rRWRU?=
 =?utf-8?B?NGRPVWFqTFE3Yi9tc0Y1bGNIcU4xWFBUNW1Wa0RCOUcvUjVnMUE0bHI5VXFs?=
 =?utf-8?B?TVdYQzRXd29DdGYwZDZRSVBTdFhiM294b25TRFF3UW1WZS9WNXdiT3JQTnlN?=
 =?utf-8?B?dlltdVJjVGl0dmo3dVJpWFBRZkNncng2YncyZkQ4ZHZCVFB1cGd4c2JWQnUv?=
 =?utf-8?B?SlAwNllBbmw2STUvK0NqYnN6cmp4MjZVclo3YSsxM2dnMmQrSFd0ZFM4UU11?=
 =?utf-8?B?Y0E3dW9tbW0wZUVIWVUzT1AxbFVZVjVucE9xb3BYRmh6c3dMOUhpL3hRWUtZ?=
 =?utf-8?Q?WgnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJnTTZ4VUVUanZ4ajNUVTMwcFNza0pzYWptR3FCaFBtcStDUWM3Tml5UUJD?=
 =?utf-8?B?bStGLzkzc3FoWVhjekFWcnliTk1TVEhnRlZWMHNsdHZNU1U0TFhkUE80V1BJ?=
 =?utf-8?B?aU5mMVdCN1VFakpLRXpVbW8wNEd3UHFlRVpKbzRGNHJMRjZZTTZ2RkVHMk84?=
 =?utf-8?B?ZTlRMzlVa0F5M0ZrOG5JYnlyZ1RaazlrbVhESFlsYTVVZEZaRkR3Zjlia1Va?=
 =?utf-8?B?Vks0cFJpR0RqSlVadEh4QlV5QWJPSWhScmdIVHhVM2dWQlg4ZjVTRTBvc0lZ?=
 =?utf-8?B?VFJVUC8wc0s3SlkxWXVlckxUaHVyYytsMTV1T0gxUCtqaGw4bk0xZEhjcUZh?=
 =?utf-8?B?Ti9zYm1FdXA1U3hNQXJjaE15bko3V0pIZExqVXAwbmorYmhTSnFUTDBiQlRK?=
 =?utf-8?B?eDk5dEVMbmMzaGt5cUgzQlkvN1pPL3V3bGI0RVRsSXdoZWRuSEJvMGJuTFZ6?=
 =?utf-8?B?NSszQ2NkOEVDVmhmQ00rSENiWDRjQ1dGRGRsU0s1R2VBK1BvaThRekJiTkN3?=
 =?utf-8?B?OUFmRTY4aXZZS0FRRHVtbHFoWHU1ZU8zSzlnbENjMjF4MWpsSWpwVE9EcXpR?=
 =?utf-8?B?Q0k5NURCQURTSTlQL3owcFNoRnhMQzZod0wxcGdycVBwbHQwNTN0MFpLaHRI?=
 =?utf-8?B?SXEzblNIbklaMEN6em82ZjFyRjBCckJQOUFENk8rNlZCN1JyS0pPeVVFNlpF?=
 =?utf-8?B?c25hOEl3OXd2SlU2WGRxTTlPanVYSG5mNi9LaTVXZUdnM3BxaEZaZWNkb2pO?=
 =?utf-8?B?cThmd3FNb0R0WkxvV2FoaGRIdkFCOXp1VHlOMkwwRWhxTmlRdllIcWNydWUx?=
 =?utf-8?B?RVJtS2NFeDVYbXgzRWR6VmFyZlQ2bzE3M2FwVmYxaWNuSGRiakJjN1lIOEZy?=
 =?utf-8?B?bEQxS0Mwd2hSVnkzN1BrZ3NxRzlKVXpZaFBGS0w5aXBoUjZ4WU43RXUvek5P?=
 =?utf-8?B?QjRsaDJiTHM3dEYzeFNkNDM4OGRVb3hETk9tUUx0U2hrMGQvTHlxMlo2K2Ft?=
 =?utf-8?B?Sm85MHdGS1lNcHJsUVc1WmJlb1R2M1REYmhGNmNCRFpvZDgwUmRRMXVsYUta?=
 =?utf-8?B?OHZrUDV2bElzdi9yWXZueDN6dzhsZ3pDMUw1amdBZVhXK01vdDlvQTdNclVY?=
 =?utf-8?B?Y2o0RkdycVVqbys3bDEyQkJ6RVBxWXBic3ErNHQxRnJteTlsaWEvZy9yYkN4?=
 =?utf-8?B?N1dNMytPMlpZbHYwSHJLT2t0ME9YYzlXelROQ2M2OXYwR1VSSXplUWFjQTU4?=
 =?utf-8?B?czVGbEZqYVFxOEtjRWtQUndDc1gyczBHM1BGd1QrK3VBWWIycXFkZ3NDaHdO?=
 =?utf-8?B?bG9WVXZ0UEhFU0E0WjZ4d0pqbGU4WVJtczFMUysxMUkvUzJSaERPWW5VZ25s?=
 =?utf-8?B?UjVOa2pHYmQzaXVacVh1QUZWcEhzRGhkOXMwaGNlSTRFTWZvRFBOajVKUFo0?=
 =?utf-8?B?aDVjcVhiR0MwanlsN0FHZTNUbG82c3hzVzZXaUNmcmRMZU41TFRmRjU3R1Fh?=
 =?utf-8?B?NW16TnNuUXdjMmFEcTVRRHJCSXk1WENrWVNQVGI2ZzRQQVZKSnZJc3VDbU11?=
 =?utf-8?B?MXFndXpvY05COTFZTERDanY0Y3JQdnF6bFJvZG9KRWlGeUhuNzlwRjBSUEVv?=
 =?utf-8?B?OUE4UXk1RTl3MGdNek95dVl6KzdkbXF4N3NQaHgwOTFLcTlxaWpNV0VlMDlF?=
 =?utf-8?B?U1J0THRlVS9DZ2Jkam1lSjFhUlBCQ2hoV0NFakFoRkxSZjVwQy9Jc1RIKzM0?=
 =?utf-8?B?bmp5aW1QQ0Z1bitXU3UvV255cFZ6UzNSTVQ5ZllHV2VQMkRiSWlnNEdobldQ?=
 =?utf-8?B?aTUvWUJkK2ZaVm8xU3MzY0hkVUYvL2x4VzB6TWZOZXJRTi82aXorMU1VYVFU?=
 =?utf-8?B?cWNrRmhiU29EalVPaGJMNnkzanoxK2JWUDdxcHhLeitZWFVhUlhtMjl4cGEz?=
 =?utf-8?B?Q2lIQ1oxWkNacUdidkh6ZmdQYzFTWUxZVEc1cW9vdTVuSGRhODVVWndsT0h3?=
 =?utf-8?B?cjZGM1VwTStnUzZqbHZyakVYL0U5MVVaYWJySk1wZVluR3dqM095aE1qbFE0?=
 =?utf-8?B?aG11aFJpVk1BSlRoLytsSFI1SVlndkM3My80bXBwL3Y4OGs2dTN0VjJMRXc4?=
 =?utf-8?B?MU9pYjRZWHlnWUJSMFlMQmNwdGIxQ1lWZm1weER6dUt2a0VaVkwyWmZuaWxh?=
 =?utf-8?B?dGhOdWxIN0htZittUkhTOHRyNHZyck9mUEhpT2cvQ1psaDMwVzFlM1J5WG9h?=
 =?utf-8?B?UWY5S2laZDZ6eGp6RkFWdXVDU2JFUUFoNnYzczhadmkrOTRXdlhqYkFORGVP?=
 =?utf-8?B?OUdSOGVwQ1FsN3dUcWh2eTZmN1NkOFhxdHFralMxVWZ2U0FpWjRkZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86238901-17db-42d3-efe0-08de58b99503
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 06:52:02.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Is6qI+PqttIH/7dsUIIpwMXSMFiy9nrtAp2XI4/a6mt1Yv1p6QNOeSQYpr2VLLg14z4StPfP4f9JT1Tp8od9NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF10012BF96
X-OriginatorOrg: intel.com
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-12979-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,linaro.org:email];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adrian.hunter@intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AC2F952718
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13/01/2026 00:48, Brian Masney wrote:
> Use the linux/platform_data/pic32.h include instead of
> asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
> is in preparation for allowing some drivers to be compiled on other
> architectures with COMPILE_TEST enabled.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> 
> ---
> To: Adrian Hunter <adrian.hunter@intel.com>
> To: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/mmc/host/sdhci-pic32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-pic32.c b/drivers/mmc/host/sdhci-pic32.c
> index 7ddac0befed87e6e46acfa7593203a5b540558bf..2cc632e91fe454bf29c1da22e45135d5d0267f54 100644
> --- a/drivers/mmc/host/sdhci-pic32.c
> +++ b/drivers/mmc/host/sdhci-pic32.c
> @@ -18,6 +18,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/of.h>
> +#include <linux/platform_data/sdhci-pic32.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/slab.h>
> @@ -25,7 +26,6 @@
>  #include <linux/io.h>
>  #include "sdhci.h"
>  #include "sdhci-pltfm.h"
> -#include <linux/platform_data/sdhci-pic32.h>
>  
>  #define SDH_SHARED_BUS_CTRL		0x000000E0
>  #define SDH_SHARED_BUS_NR_CLK_PINS_MASK	0x7
> 


