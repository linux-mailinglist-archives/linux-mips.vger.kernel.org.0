Return-Path: <linux-mips+bounces-6842-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F079E1616
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 09:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3E96B22815
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 08:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DD31A01B9;
	Tue,  3 Dec 2024 08:16:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84C9156F45;
	Tue,  3 Dec 2024 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213804; cv=none; b=DliaNoAha2DF2sBgvj+qW2hc15JLlSDoBYaF/hL7ROHaMo3BqLcFfSztEFs8NYVgMAWU23ck7pyrLKcYv9Ti2WrcOpT/h3KcYEbit0QWgEosB5g8h2Y622PFh0bcDZa30BbwQq5Cn1UOZYty1mX2pk1WELnOcLbSehzEKWxo2cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213804; c=relaxed/simple;
	bh=n6+pJ2yNwzxfIMZ18ROmL5D/+s3BjzPFYjKF9PZzvqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y8dn47yP7LB+L4pBn7euABRamDq4B2sfTC4MMim4CnMP5twum8SreaXftGttkd+jkCtZt8pW4OFz75aTrNKii3h8RlKA4NJvxyiPQ43fPgDIagHayf+VbAWrbWf1MIcxxdF/X6MnTPnoDV2wCUaobGB5E+cfm7OXBZHm79vVIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.2.102] (213.87.144.196) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 3 Dec
 2024 11:01:23 +0300
Message-ID: <8f1bf562-a0be-442c-bcff-ced166916660@omp.ru>
Date: Tue, 3 Dec 2024 11:01:20 +0300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Add a blank line after __HEAD
To: Rong Xu <xur@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Masahiro Yamada <masahiroy@kernel.org>, Klara Modin <klarasmodin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicolas Schier <nicolas@fjasle.eu>, Chris Packham
	<chris.packham@alliedtelesis.co.nz>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
	<linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241202212109.3201452-1-xur@google.com>
Content-Language: en-US
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20241202212109.3201452-1-xur@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 12/03/2024 07:39:55
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 189565 [Dec 03 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.7
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 44 0.3.44
 5149b91aab9eaefa5f6630aab0c7a7210c633ab6
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;213.87.144.196:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.144.196
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/03/2024 07:43:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 12/3/2024 7:01:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 12/3/24 12:21 AM, Rong Xu wrote:

> Add a blank line after __HEAD in the text section.
> 
> This change is based on a suggestion from Maciej W. Rozycki
> <macro@orcam.me.uk>.

   There's Suggested-by tag for that. :-)

> The __HEAD symbol was added in commit 52892ed6b03a ("MIPS:
> Place __kernel_entry at the beginning of text section").
> 
> Signed-off-by: Rong Xu <xur@google.com>
[...]

MBR, Sergey


