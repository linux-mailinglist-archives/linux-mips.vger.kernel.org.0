Return-Path: <linux-mips+bounces-6782-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DE99D57E8
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2024 02:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEE901F2295C
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2024 01:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A9E1805E;
	Fri, 22 Nov 2024 01:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Vq2S3u01"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D954A1F94D
	for <linux-mips@vger.kernel.org>; Fri, 22 Nov 2024 01:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732240702; cv=none; b=VImjOsss/W4SQfctv0sEGI5+gNnwsHG0EGHrbWDTDrntxcBRXIrvRXmieesQCURurPikIRxzZPmOJ5mTEoQ7Juub7h3YfG1mruX2qRJBZxjQFIqfiiEV8Qxdfz8nUYdKLGk4XeHMaj4ykE0NWqPSvIGlqXMqI9TUlAQx3PqfmTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732240702; c=relaxed/simple;
	bh=0T7OrMhXG8GjtlJ05w6Ef5dZ2InAAAO4TAlxDSH8rhU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ecz6w7qYlMQFIpMBKMvDGBnYAiWaMf1kLqAXpmA1WC9z5inSWYqI5M5yga2YVopw5kUTridKAh5vUniZXc2Lw792JAU7slzZfibsT4MCrU5tNEGmPbXpSJPnMUalLpbFb3EptAvqxIwB156hP2ljMQYY8VNAlYFI/dKILAcHwCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Vq2S3u01; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 057572C0404;
	Fri, 22 Nov 2024 14:58:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1732240691;
	bh=Vhx0bgfezwl3xI6FT4RJgmF1yQQdPfxHYD8+VnPONCo=;
	h=Date:To:Cc:From:Subject:From;
	b=Vq2S3u01WJAA4bToV6DdEC3Y2rHPLtQQ1q2pzbtVK1aQT+6NRGwD6TXOqMqyja+ok
	 TLydcCRX3ycVOrPnbEnFTRRETs2YkvzGeiYha8YMk82VkwaSCzdP1ah9bw9V2ZXo8E
	 efwgsu2C4D/3roS5phSr7qWVDePHI/dLv7MCcDYoawtW2CSDlvhCYUZD9tlACLJccR
	 7vRRT6OMYT/svvScYotGwt7dwYDf9OoMY+pJ6lWmKoXO/FkCzENFSx2RFfotwXpjXe
	 bmiHApzoZoUct8LGMb2WEj/mddF9TEGdSaLHTQUCSH3NYgmOcC0P7brHB+1UrJ+7UO
	 URXf4lM48M7Cw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B673fe5320000>; Fri, 22 Nov 2024 14:58:10 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E802113ED7B;
	Fri, 22 Nov 2024 14:58:10 +1300 (NZDT)
Message-ID: <cd252b78-077b-441e-8371-106d71258ff3@alliedtelesis.co.nz>
Date: Fri, 22 Nov 2024 14:58:10 +1300
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Content-Language: en-US
To: Rong Xu <xur@google.com>,
 "Han Yao Yeo (atg)" <hanyao.yeo@alliedtelesis.com.sg>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Masahiro Gotoh <gotoh@allied-telesis.co.jp>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: RTL9300 (mips) fails to boot with commit d4a7f2510ff4
 ("vmlinux.lds.h: Adjust symbol ordering in text output section")
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Gam0nhXL c=1 sm=1 tr=0 ts=673fe532 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=MNytMTIMXeScYOCCFdsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Hi Rong,

I was just trying some of my in-flight changes against linux-next and 
found that my RTL9300* based board no longer boots (nothing on the 
serial console after U-Boot hands off to the kernel).

A bisect between Linus's tree and linux-next/master points to commit 
d4a7f2510ff4 ("vmlinux.lds.h: Adjust symbol ordering in text output 
section"). A build on d4a7f2510ff4^ boots successfully. That series is 
well beyond my area of knowledge, there may be something that the MIPS 
SoCs are doing (or not doing) that is being affected by the sections moving.

Thanks,
Chris

[*] - The RTL9300 is a Realtek Ethernet Switch with integrated MIPS SoC.


