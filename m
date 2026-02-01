Return-Path: <linux-mips+bounces-13082-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG5jLd2df2lWugIAu9opvQ
	(envelope-from <linux-mips+bounces-13082-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 19:39:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6680AC6F8C
	for <lists+linux-mips@lfdr.de>; Sun, 01 Feb 2026 19:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B6C823000FFF
	for <lists+linux-mips@lfdr.de>; Sun,  1 Feb 2026 18:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA5C26FA6F;
	Sun,  1 Feb 2026 18:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=openadk.org header.i=@openadk.org header.b="nHe54crD"
X-Original-To: linux-mips@vger.kernel.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1855E202F71
	for <linux-mips@vger.kernel.org>; Sun,  1 Feb 2026 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.238.66.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769971162; cv=none; b=dTG7fcFOwolmuS8QOyzspqOS4rFgbrbKFRJcrKpbVtUuzxnvlJuevcTFAUZftFrA67ioReB84Bf6KQy94iOnc57xjqCDsHWKl0ya3646GSgAyUBQZTZJyntVZtgICVEdgHOiGNaAZY1+zzKMWUnQsKA2xsU6cwMwQ5B/lSkQXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769971162; c=relaxed/simple;
	bh=TIyQBrsaCFHDWoyiOSw3i/5MGiOXssoNqXJpcPOYfx0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/uC3dGIIeC1v3HYLMUs77Qi9VkS9KgdZJEBxXsXqmhM+tr19pTTIMSSyHF5+R2NVDDHvrXhLbVLr8xxUMiOcFLdsCJ/fWbEmwu0NNowFw6mhwy3/pHoonwaA4IfIr/pUWYB0vQY1pVPax4XoI37W8CygpbVPGzQb/T7dY8rBoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org; spf=pass smtp.mailfrom=openadk.org; dkim=fail (0-bit key) header.d=openadk.org header.i=@openadk.org header.b=nHe54crD reason="key not found in DNS"; arc=none smtp.client-ip=89.238.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openadk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openadk.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
	t=1769971153; bh=TIyQBrsaCFHDWoyiOSw3i/5MGiOXssoNqXJpcPOYfx0=;
	h=Date:From:To:Subject:From;
	b=nHe54crDtil+bB3XtGnxE0DD2na6LDHzdPeVLd+VrVisHiR1JL7d0/ki/XlorzpKw
	 uznZecKFESlOnbKj2wSH8fd/F7CJ4jd5J8u8d3j1ZB1o4hTOj7b8XANJ83uHf0kGtA
	 wKkt2daBTIWcQU3MM3QS6xAq3ku1MBQna2M3Blj3iV+LHsNC1VjR9XU8ncx4E9KN8x
	 bMDOXem1kMKPbEDoc2WLSEEQ9OEvgGqzdvK0z9zN3DCnVChn5fl/RI35ghuXQeOv2O
	 PiiG90rze3C2E0GnNScVV5gPesTOjcUMOaY943ogDe6D0J4wYKNnH3nQvaV3mQgoAJ
	 Oivvmr0a+rOGA==
Received: by helium.openadk.org (Postfix, from userid 1000)
	id 8AEF831E0B83; Sun, 01 Feb 2026 19:39:13 +0100 (CET)
Date: Sun, 1 Feb 2026 19:39:13 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: linux-mips@vger.kernel.org
Subject: serial console on Mikrotik RB532 non-working
Message-ID: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[openadk.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	R_DKIM_PERMFAIL(0.00)[openadk.org:s=2022];
	TAGGED_FROM(0.00)[bounces-13082-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[openadk.org:~];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbx@openadk.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.943];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:email,waldemar-brodkorb.de:mid]
X-Rspamd-Queue-Id: 6680AC6F8C
X-Rspamd-Action: no action

Hi MIPS hackers,

I want to use the latest Linux kernel on my Mikrotik RB532, but the
serial console is non working. I bisected the problem and the first
breaking change is this commit:

6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 is the first bad commit
commit 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6
Author: Yi Yang <yiyang13@huawei.com>
Date:   Tue Jun 28 16:35:15 2022 +0800

    serial: 8250: fix return error code in serial8250_request_std_resource()
    
    If port->mapbase = NULL in serial8250_request_std_resource() , it need
    return a error code instead of 0. If uart_set_info() fail to request new
    regions by serial8250_request_std_resource() but the return value of
    serial8250_request_std_resource() is 0, The system incorrectly considers
    that the resource application is successful and does not attempt to
    restore the old setting. A null pointer reference is triggered when the
    port resource is later invoked.
    
    Signed-off-by: Yi Yang <yiyang13@huawei.com>
    Cc: stable <stable@kernel.org>
    Link: https://lore.kernel.org/r/20220628083515.64138-1-yiyang13@huawei.com
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 drivers/tty/serial/8250/8250_port.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

When I compile the commit before this commit everything is fine.
When I just try to revert it on master I still get no output on my
serial console.

Anyone here have an idea what is defect in arch/mips/rb532 nowadays?

Thanks in advance,
 Waldemar

