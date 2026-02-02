Return-Path: <linux-mips+bounces-13087-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIDkGzQ7gGk75AIAu9opvQ
	(envelope-from <linux-mips+bounces-13087-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 06:50:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5C9C85FC
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 06:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 547433008798
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 05:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7193E279336;
	Mon,  2 Feb 2026 05:50:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3912A1BA;
	Mon,  2 Feb 2026 05:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770011439; cv=none; b=g5T2orKxf8JfKXD5oyJpo/LYAk6OZIVux35PV/+dNdQ96MafQMV3KQaGLC2OUVE2qwbDPeW1kIvoSrG8zytp8frcOTtQWm/TCCCYMPVcACl9OHZI34IK/6pDEpI380ugJTXhRehkumZ9+pTCyop7PE5/VbVnl38vfTGtxUQbP30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770011439; c=relaxed/simple;
	bh=lKviBifOxph42nX+j/8gUqtfXj3QNZh/oLrOhbWnadk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qDAyKLc4XXcCGNOIfRqUljIgxW4AfFrH0QTFsXmTL4rYkMZYHahGJzaoPt0RfnwBcXPeRfGPs/nd8mKMYKZ+TPyvHwHtFHvHhlmGREpcaNpS2S/MFs/T8YTmMA3l9gZeLagnSq2tUE/t/P6RF3ZZi7GG7QZVCTFKshxILk4jbAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.235])
	by APP-05 (Coremail) with SMTP id zQCowACXKAwhO4BpDf5KBw--.42523S2;
	Mon, 02 Feb 2026 13:50:25 +0800 (CST)
Message-ID: <b26dd193fe62d490c6c3aa6df93c5b0dc6749ffe.camel@iscas.ac.cn>
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mips@vger.kernel.org
Date: Mon, 02 Feb 2026 13:50:25 +0800
In-Reply-To: <87v7ggfnby.ffs@tglx>
References: <20260131094547.455916-1-zhengxingda@iscas.ac.cn>
	 <20260131094547.455916-6-zhengxingda@iscas.ac.cn> <87v7ggfnby.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:zQCowACXKAwhO4BpDf5KBw--.42523S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1fJF1kXr4kXF1fCw1UGFg_yoW8ZrW3pr
	18JFW5JFWUGrnYqr18tF1kAryrAr18Ja1UJr18XF18Jw1DJr10qr1UXr9Fgr1UJr48GF1U
	Jr1jq3WUZrnrJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACY4xI67k04243AVAKzVAKj4xxM4xv
	F2IEb7IF0Fy26I8I3I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GF
	yl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
	JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
	AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42
	IY6I8E87Iv6xkF7I0E14v26r1j6r4UMVCEFcxC0VAYjxAxZFUvcSsGvfC2KfnxnUUI43ZE
	Xa7IU8fR67UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13087-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA5C9C85FC
X-Rspamd-Action: no action

5ZyoIDIwMjYtMDItMDHmmJ/mnJ/ml6XnmoQgMTc6MTkgKzAxMDDvvIxUaG9tYXMgR2xlaXhuZXLl
hpnpgZPvvJoKPiBPbiBTYXQsIEphbiAzMSAyMDI2IGF0IDE3OjQ1LCBJY2Vub3d5IFpoZW5nIHdy
b3RlOgo+IAo+ID4gQXMgdGhlIChrZXJuZWwtaW50ZXJuYWxseSkgT0YtYmFzZWQgTUlQUyBMb29u
Z3Nvbi0zIHN5c3RlbXMgY2FuCj4gPiBhbHNvCj4gCj4gV2hhdCBhcmUga2VybmVsLWludGVybmFs
bHkgc3lzdGVtcz8KCkkgbWVhbiBrZXJuZWwtaW50ZXJuYWxseS1PRi1iYXNlZC4gVGhlc2UgZGV2
aWNlcycgZmlybXdhcmUgZG9lcyBub3QKc2hpcCBEVCwgYnV0IExpbnV4IGtlcm5lbCBzaGlwcyBz
b21lIERUcyBhbmQgcGljayBvbmUgYnkgYXJjaCBjb2RlLgoKRG8geW91IGhhdmUgYW55IHN1Z2dl
c3Rpb25zIGZvciByZXdvcmRpbmcgdG8gbWFrZSB0aGlzIG1vcmUgY2xlYXI/IE9yCnNob3VsZCBJ
IGp1c3Qgc3RvcCB0byBtZW50aW9uIHRoaXMgaW1wbGVtZW50YWlvbiBkZXRhaWw/Cgo+IAo+ID4g
aGF2ZSBQQ0ggTFBDIGludGVycnVwdCBjb250cm9sbGVyLCBhZGQgT0YtYmFzZWQgaW5pdGlhbGl6
YXRpb24gY29kZQo+ID4gZm9yCj4gCj4gaGF2ZSBhIC4uLiBjb250cm9sbGVyLgo+IAo+IEFkZCBP
RiAuLi4uCj4gCj4gPiArI2lmZGVmIENPTkZJR19PRgo+ID4gK3N0YXRpYyBpbnQgcGNoX2xwY19v
Zl9pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkZXZpY2Vf
bm9kZSAqcGFyZW50KQo+IAo+IE5vIGxpbmUgYnJlYWsgcmVxdWlyZWQuCj4gCj4gPiArewo+ID4g
K8KgwqDCoMKgwqDCoMKgaW50IHBhcmVudF9pcnE7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
Zndub2RlX2hhbmRsZSAqaXJxX2hhbmRsZTsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCByZXNv
dXJjZSByZXM7Cj4gCj4gVmFyaWFibGUgb3JkZXJpbmcuCgpJcyB0aGVyZSBhbnkgcnVsZSBmb3Ig
dGhlIG9yZGVyaW5nPwoKPiAKPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChvZl9hZGRyZXNzX3RvX3Jl
c291cmNlKG5vZGUsIDAsICZyZXMpKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldHVybiAtRUlOVkFMOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcGFyZW50X2lycSA9IGly
cV9vZl9wYXJzZV9hbmRfbWFwKG5vZGUsIDApOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKCFwYXJl
bnRfaXJxKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJfZXJyKCJGYWls
ZWQgdG8gZ2V0IHRoZSBwYXJlbnQgSVJRIGZvciBMUEMKPiA+IElSUXNcbiIpOwo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+ID4gK8KgwqDCoMKgwqDC
oMKgfQo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaXJxX2hhbmRsZSA9IG9mX2Z3bm9kZV9oYW5k
bGUobm9kZSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcGNoX2xwY19pbml0KHJl
cy5zdGFydCwgcmVzb3VyY2Vfc2l6ZSgmcmVzKSwKPiA+IGlycV9oYW5kbGUsCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXJlbnRfaXJx
KTsKPiAKPiBJZiBwY2hfbHBjX2luaXQoKSBmYWlscyB0aGUgcGFyZW50IGludGVycnVwdCBtYXBw
aW5nIGlzIGxlYWtlZCwgbm8/CgpJIGRvbid0IGtub3cgYW55IHJldmVyc2Ugb3BlcmF0aW9uIGZv
ciBpcnFfb2ZfcGFyc2VfYW5kX21hcCgpLCBhbmQgbW9zdAppbXBsZW1lbnRhdGlvbnMgSSBzZWUg
aGFzIG5vIGNsZWFudXAgY29kZXBhdGggZm9yIHRoaXMgcGFyZW50IElSUS4KClRoYW5rcywKSWNl
bm93eQoKPiAKPiBUaGFua3MsCj4gCj4gwqDCoMKgwqDCoMKgwqAgdGdseAoK


