Return-Path: <linux-mips+bounces-633-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB2B80AA9F
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 18:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0E81C20889
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 17:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CAA439846;
	Fri,  8 Dec 2023 17:22:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B8D21BDD;
	Fri,  8 Dec 2023 09:22:25 -0800 (PST)
Received: from [192.168.1.104] (178.176.72.145) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 8 Dec
 2023 20:22:17 +0300
Subject: Re: [PATCH v4 05/22] MIPS: Fix set_uncached_handler for ebase in
 XKPHYS
To: Gregory CLEMENT <gregory.clement@bootlin.com>, Paul Burton
	<paulburton@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	<linux-mips@vger.kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, Tawfik Bayouk
	<tawfik.bayouk@mobileye.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, =?UTF-8?Q?Th=c3=a9o_Lebrun?=
	<theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@intel.com>
References: <20231208161249.1827174-1-gregory.clement@bootlin.com>
 <20231208161249.1827174-6-gregory.clement@bootlin.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <84c0be90-a4f6-98b4-3011-8e3efbf6d5c5@omp.ru>
Date: Fri, 8 Dec 2023 20:22:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231208161249.1827174-6-gregory.clement@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.0.0, Database issued on: 12/08/2023 17:06:02
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 181987 [Dec 08 2023]
X-KSE-AntiSpam-Info: Version: 6.0.0.2
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 6 0.3.6 62f5a4619c57459c9a142aa1486ed27913162963
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.72.145 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.72.145
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/08/2023 17:10:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/8/2023 1:21:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 12/8/23 7:12 PM, Gregory CLEMENT wrote:

> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> ebase may be in XKPHYS if memblock unable to allocate memory

   Is unable...

> within KSEG0 physical range.
> 
> To map ebase into uncached space we just convert it back to
> physical address and then use platform's TO_UNCAC helper
> to create mapping.
> 
> Co-developed-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@intel.com>
> Co-developed-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>

  Hm, too many developers for such simple patch... :-)

[...]

MBR, Sergey

