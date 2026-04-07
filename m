Return-Path: <linux-mips+bounces-14079-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP7VLZ9m1GnptgcAu9opvQ
	(envelope-from <linux-mips+bounces-14079-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 04:06:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 940B53A8DB1
	for <lists+linux-mips@lfdr.de>; Tue, 07 Apr 2026 04:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0ABB6301378A
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2026 02:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE67426FA6F;
	Tue,  7 Apr 2026 02:06:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7261EB5FD;
	Tue,  7 Apr 2026 02:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775527580; cv=none; b=M26xw7E/g6Rmq9iLU1aDMfR5HJi+imrJcSbZ8P7gX7//+tARv02p2DjuCmpaO0GZxCS9Ba8xkoS8sSBlnnBfS9d7XjvIMSA+Ht7yEIHXg4ph+gDCIu6Pt+Ha8hbjkSNyoZu9q7IvVuLCJEfEXgG1CjbMTBIv5wg90EVY58yjWfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775527580; c=relaxed/simple;
	bh=KV5GHsFWYPBUyH36wutV6W+qINMwF8QlgJg2092Cr2Y=;
	h=From:Date:Message-ID:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McPgwC0Hg3oHGBNQ93PxWXJ6MWIrMwFKYDL8dxjEhwJoqOI2LbW6W2GVLQA3kmYLD10N1RO+ZHg9hP1eLs96mn94c2iXFf4mfwnYat8Exc8MAQKOEKuky7evnhc028QX2WcSleZ7pjJu0DiDK34DCWGeRRzVKAxgHQDJgGyGVEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from 0002-mips-dt-bootargs-reply.eml (unknown [111.196.245.197])
	by APP-01 (Coremail) with SMTP id qwCowABnC2eRZtRpCpx2DA--.63199S2;
	Tue, 07 Apr 2026 10:06:09 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
Date: Tue, 7 Apr 2026 11:30:01 +0800
Message-ID: <20260407113001.2-mips-dt-bootargs-reply-pengpeng@iscas.ac.cn>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] MIPS: validate DT bootargs before appending them
In-Reply-To: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
References: <20260403161001.1-mips-dt-bootargs-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnC2eRZtRpCpx2DA--.63199S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYz7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87
	Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAI
	w28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
	73UjIFyTuYvjfUozVbDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14079-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.818];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 940B53A8DB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sergey,

Thanks, that makes sense.

I have folded the validation into a bounded strnlen() check before the
append, and will resend it in that form.

Thanks,
Pengpeng



