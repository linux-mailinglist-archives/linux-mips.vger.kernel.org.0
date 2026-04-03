Return-Path: <linux-mips+bounces-14026-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAPcAS3Dz2lH0QYAu9opvQ
	(envelope-from <linux-mips+bounces-14026-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 15:39:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7290B3949BF
	for <lists+linux-mips@lfdr.de>; Fri, 03 Apr 2026 15:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 307E2305C3C7
	for <lists+linux-mips@lfdr.de>; Fri,  3 Apr 2026 13:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5076A3BC67E;
	Fri,  3 Apr 2026 13:37:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80861F8723;
	Fri,  3 Apr 2026 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775223439; cv=pass; b=qXCbPDOAhnZ2UnL19l0BwbgBstLireISPzKBRP5qagOSt3su7b8HTHMf991C0HOyF8tvpVWuFZoalJswtaa1C4FatTKl6d8QH5ZftP3zKlAhVHwvIs5cVX3HDroLTXDQRN9Dc3fWGS6I7zN7VDW4utkN1XjbxlJN/Ncq0dpkTyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775223439; c=relaxed/simple;
	bh=5XfZLHW917GPeLmoi8RTcOFMV7PSrf1WdMyL1/K92YM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDN1LSUXS3vQtr3rzCnhisjxI0mpIgWHGaIRsIKHa4NE2m/wDvOqD+cgKuBKtN5c7cAnQBJ+btY1Q/rxAVkuXGu0a3DrFDI2CsbaSXq9gHGljhlcQjWV29o18nHXk3xxCQqRRCHXQe2+zTVNnQ8yx6pvNzCYbSk81chVPqRMJdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trained-monkey.org; spf=pass smtp.mailfrom=trained-monkey.org; arc=pass smtp.client-ip=136.143.169.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trained-monkey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trained-monkey.org
ARC-Seal: i=1; a=rsa-sha256; t=1775223288; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=XsFx4p5VgwLYs8/vuiRIhFYYY7BZEtsdweYoyutsI5s268xHDZNE+1aosDKf5tOhWsVRislQ2rdBSUSa3fCzPaXhQ7Jdtd14qGY8D0s0mK+KI8/ZOgGLtIlFsNetysymzkEm9B+sJUcbGoymfigIjm3FIkkIgaoeHQH/4ENLOjY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1775223288; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=InLCCKin5kc31jhHqJ2/xj58R/AdCjuyS3cbeNCAucg=; 
	b=lR3dFmcub3ObCAdL18l5iaak8Gdiovaq3Tlv5KCFP7EBHANgryMrZkVOEJB8fSUW5MlwFmvffcCYzAUr4kG8Ob5saqKe5ZMxR7XXQMzbCi79zRQMOFW+87zJDova5JdrpCtyj2UlIF+m1T9nJVioaY+neqHcxDVDkzKGLqW3R6o=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	spf=pass  smtp.mailfrom=jes@trained-monkey.org;
	dmarc=pass header.from=<jes@trained-monkey.org>
Received: by mx.zoho.eu with SMTPS id 1775223284898804.3284909269775;
	Fri, 3 Apr 2026 15:34:44 +0200 (CEST)
Message-ID: <ec7e71f6-7e95-4f22-8b80-d0925d5bd9c8@trained-monkey.org>
Date: Fri, 3 Apr 2026 09:34:38 -0400
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
To: Greg KH <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, bhelgaas@google.com,
 dakr@kernel.org, kwilczynski@kernel.org, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 ebiggers@google.com, ardb@kernel.org, tiwai@suse.de, tytso@mit.edu,
 enelsonmoore@gmail.com, martin.petersen@oracle.com, jirislaby@kernel.org,
 geert@linux-m68k.org, herbert@gondor.apana.org.au, vineethr@linux.ibm.com,
 lirongqing@baidu.com, kshk@linux.ibm.com, vadim.fedorenko@linux.dev,
 dong100@mucse.com, wangruikang@iscas.ac.cn, hkallweit1@gmail.com,
 kees@kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260402183029.1236713-1-kuba@kernel.org>
 <2026040357-flick-coil-0c5d@gregkh>
Content-Language: en-US
From: Jes Sorensen <jes@trained-monkey.org>
In-Reply-To: <2026040357-flick-coil-0c5d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14026-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,xen0n.name,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,garyguo.net,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
	DMARC_NA(0.00)[trained-monkey.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jes@trained-monkey.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.743];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trained-monkey.org:email,trained-monkey.org:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 7290B3949BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 4:48 AM, Greg KH wrote:
> On Thu, Apr 02, 2026 at 11:30:29AM -0700, Jakub Kicinski wrote:
>> The entire git history for this driver looks like tree-wide
>> and automated cleanups. There's even more coming now with
>> AI, so let's try to delete it instead.
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Jes Sorensen <jes@trained-monkey.org>


