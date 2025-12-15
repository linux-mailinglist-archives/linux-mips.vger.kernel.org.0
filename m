Return-Path: <linux-mips+bounces-12481-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D9CC011C
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 23:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AAAF300EDE2
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 22:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59409288502;
	Mon, 15 Dec 2025 22:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="I7pjcad0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D9821A95D
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 22:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765836145; cv=none; b=ngAFqOdkmUg+npM4usdR9fkNqwg2DTWXF8woKGLcUzTGN3qEl5UaTh+JP1ZrFZkjCSxtkUwDZj9VtjL+UKH2345f6EzkNlznqPW9XUUrX+oiCFQiK48uEVqCUWSKYjDa50jynMyv5+hEgVDJPD3UYlEwc2kyNUD2g7abUAO/veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765836145; c=relaxed/simple;
	bh=5lo3NcR4BCkGv5agRSia2/gU3jS/8Xwwxv1nImmhCMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHPf+rM8+3eqy9DK1bbuk4O/kTRmceMWCjIbhCT4YpZzqJNeqW1514qUYb5Kd4WMcz00in6jl04X6DcX6jsPHG2CBZPoY/liKGXj9FuhPZaSRiingQ0uTyCnND1xbJp4QutV/K1mnyhAPAKcwlyJ4MPqQOmjCYUUvl+NrmDcZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=I7pjcad0; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dVYvH1Q4cz9tKY;
	Mon, 15 Dec 2025 23:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1765836139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lhB8sCq7hbtJTEzxl78HuWEfOAuGiNO6DdnzRVC8Y5c=;
	b=I7pjcad0W2xJs57vKidHpYVufSKMl7BRHA8BzWdlnPaCBXD9EiQxOzw+kreukabdsSxOhP
	bOMkAjjHkXSIBMkPxiYGRd/2F64LyKDoIRp8vzUlnBY6LnGW7wqKrusIjVh9aAh2s2nAg0
	tguNkGI8YL0ekxibeyNbPDHiXOLXgiGd+So/cyoFUEvFV0r8Olzw+3n9TGwZT9Q3PIkZ3I
	ZW7lxftVVh6WfojYyXCGOymVRcT2Zv/tF4KKGnm6ATOFB6T2vsC26R8L7241wIWgaQgnWx
	LOD2eJoT3HYqZfoi5j5k7Vcod8N03nQU48yGAZB5Nq5Rt+MtGSVXYP8IoGDqLg==
Message-ID: <67b2c83a-13a7-45a5-aa47-abe71cd6878e@hauke-m.de>
Date: Mon, 15 Dec 2025 23:02:17 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Realtek rtl838x MIPS boot hangs since 6.6.119
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, macro@orcam.me.uk
References: <b35fe4b3-8f42-49f4-a6bf-9f0e56d4050c@hauke-m.de>
 <aUAaZvQfawmqNN0T@alpha.franken.de>
Content-Language: en-US
From: Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <aUAaZvQfawmqNN0T@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/15/25 15:25, Thomas Bogendoerfer wrote:
> On Mon, Dec 15, 2025 at 02:11:39AM +0100, Hauke Mehrtens wrote:
>> Linux 6.6.119 does not boot on my Zyxel GS1900-8 v1 Switch (rtl838x SoC) any
>> more.
>>
>> When I revert these two patches the system boots up again:
>>
>> MIPS: mm: Prevent a TLB shutdown on initial uniquification
>> commit 9f048fa upstream.
>> https://github.com/gregkh/linux/commit/135713cd0751bf296e515f5fdec234320f73bbd8
>>
>> MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
>> commit 841ecc9 upstream.
>> https://github.com/gregkh/linux/commit/231ac951fabae2aaed8b2c00b4a097107be49c8c
> 
> do you need to revert both patches or is t enough to revert the second one ?
> 
> Thomas.
> 

Hi,

Yes I have to revert both patches.

When I only revert "MIPS: mm: kmalloc tlb_vpn array to avoid stack 
overflow" the kernel still hangs at bootup at the same position.

Hauke

