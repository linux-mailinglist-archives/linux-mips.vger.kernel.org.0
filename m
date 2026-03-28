Return-Path: <linux-mips+bounces-13974-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMuEBb/5x2lMfQUAu9opvQ
	(envelope-from <linux-mips+bounces-13974-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 16:54:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A634F05C
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 16:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA7D6301454F
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2026 15:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46635336EF1;
	Sat, 28 Mar 2026 15:49:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C422330328;
	Sat, 28 Mar 2026 15:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774712997; cv=none; b=bOokxTji1Tc4YQgbfxE7SiR7x3zQz+UU6uJAYaeUorD48Y6xbZS6/25V9NOFVSUInFXPGKiuTWsmbvx4OiQzUFaq5lWOPxZ/PPoC+tSkuuTwzDqzNQ9EpYAcBE14MBgQz6LWy2RfbTbfxYtTEoeicQbskV5RZHuQNnTt9xsWjmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774712997; c=relaxed/simple;
	bh=W5wGDdzMXd3xpIOGIuK3qV2UEqdEtENwukdDZArEZAs=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=PPLh8Nmf1W5e7E19IDkQeRI0bDW7yqcPGApuyU1/Dejc48skgfh+Fb8DtTWtM9aRT/BDKhyK+aec8niPTc5wH5SOLi6Tlacc//lDsbP2v6e+eQVAZvEg9RsMZEUV92VhShZCYjw7ft3/faKOr3gby0vvhbdCX121paN6n49ss+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 048AB92009C; Sat, 28 Mar 2026 16:49:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 0331592009B;
	Sat, 28 Mar 2026 15:49:52 +0000 (GMT)
Date: Sat, 28 Mar 2026 15:49:52 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: DEC: Rate-limit memory errors
Message-ID: <alpine.DEB.2.21.2603281455390.60268@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[orcam.me.uk];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-13974-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[macro@orcam.me.uk,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[angie.orcam.me.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B59A634F05C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

 A recent failure of one of my systems revealed an issue with memory error 
logging where the flood of messages produced, which reported corrected ECC 
errors, made the system unusable despite the errors themselves having been 
recovered from and the messages serving informational purpose only.

 I took the opportunity and actually verified the rate-limiting does its 
purpose with the offending system before cleaning memory module contacts, 
which has cured the original problem, the third time in ~25 years I've had 
the system for -- not too bad, but clearly a recurring issue.

 For consistency I have also updated support for the other two DEC memory 
system designs, although they're parity-based and therefore memory errors 
are fatal and consequently less likely to cause a message flood, although 
in principle still possible where a faulty memory location causes a bus 
error exception to kill user processes repeatedly.  They seem not to have 
the issue with memory contacts though, which use the common SIMM design 
rather than 0.1"-pitch PCB connectors.

 Please apply.

  Maciej

