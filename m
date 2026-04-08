Return-Path: <linux-mips+bounces-14089-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKXiNUtT1mm8DQgAu9opvQ
	(envelope-from <linux-mips+bounces-14089-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 08 Apr 2026 15:08:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48E3BC96B
	for <lists+linux-mips@lfdr.de>; Wed, 08 Apr 2026 15:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A40E73074A21
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2026 13:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257B53C9EED;
	Wed,  8 Apr 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Ed8aRzW/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F6379ECC;
	Wed,  8 Apr 2026 13:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653392; cv=none; b=sKy8zhA+Bsk0qGHWjK13hqZRVI9+nmoG7jpdMZGpRVY0uB/qAK11nxP6JQHMosDvYbL2FTAamYHaNnYlgIrdSjYaBlFt8SJPqj9X/4fWLSKMWu9oPeryFVdQvVCOMqq9yIdARWFDjyieUEJe/bcVbD+woIDYY/KM23HfjbXaE/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653392; c=relaxed/simple;
	bh=Ob1cku0w8x5sQEjkY2l8IHCh542CxyvGMvo8yq7W5LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgzYeOJXNterrSImcHuSVPtogYX/GcQFGW3dH7BDP3r2zjhsn8SagiA10EH6XJdOBGRcbFcHLniTioVBJcA+NFAJBhAOI/HVy9QVO9uXpIZIzWrndC2MTu9BEpwNWBn/1YunmwRnPUTiuYPD8+uEIdfkXqROzwCxYb5/6Ufqqps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Ed8aRzW/; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89F2D1EED5B;
	Wed,  8 Apr 2026 15:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1775653384; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9pcOpxN6Pac/tfrhcOWSMi5MFBcz5khZMRo0IAJMCeo=;
	b=Ed8aRzW/e1aT4ydmqhyP1mUMg8ps7n1rXRRmiSpwoXICBp/n/BNXrs8iMawxYIwi1hfGM9
	4gAk915TNFF7pCYUJUl72JgONkS0X2uirHkxU0ieP98iXO93PrwaJL3ichDIusGjuEY5u2
	isyh0WwO7fN4Cdg/eFHAG9BEH/xb9emtX5m4XdvtO4hkGrXwVpRGP5vv8oALUEa8/oZgcF
	GxizstQ2rw6OxzT/WRpXf0pQQTvulrgT6bg38lvANHOSiMUi+I0EsHL5qmotO/VJfruJbF
	szOAHbvYwSdGLyHFJAS0ymKriK+j+99G91mLf7/lTPvQJxoEfC3oHq/En71Veg==
Message-ID: <32cd3283-b3f8-4a3c-abda-39a1423f68ca@cjdns.fr>
Date: Wed, 8 Apr 2026 15:03:00 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: mediatek: Add support for EcoNet
 EN7528
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260404182854.2183651-1-cjd@cjdns.fr>
 <20260404182854.2183651-2-cjd@cjdns.fr>
 <20260405-phenomenal-messy-shark-bdefbd@quoll>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <20260405-phenomenal-messy-shark-bdefbd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14089-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cjdns.fr:dkim,cjdns.fr:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 5A48E3BC96B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 05/04/2026 09:03, Krzysztof Kozlowski wrote:
> On Sat, Apr 04, 2026 at 06:28:53PM +0000, Caleb James DeLisle wrote:
>> Introduce EcoNet EN7528 SoC compatible in MediaTek PCIe controller
>> binding.
>>
>> EcoNet PCIe controller has the same configuration model as
>> Mediatek v2 but is initialized more similarly to an MT7621
>> PCIe.
>>
> <form letter>
> This is a friendly reminder during the review process.
>
> It looks like you received a tag and forgot to add it.
>
Whoops, that was a failed-to-press-save error, thanks for catching it, I 
will update in a few days after waiting for any additional commentary.


Caleb


The missing line:

Acked-by: Conor Dooley <conor.dooley@microchip.com>


