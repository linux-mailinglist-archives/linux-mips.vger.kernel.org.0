Return-Path: <linux-mips+bounces-7613-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE4CA1FF94
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 22:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 198171613A6
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jan 2025 21:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0AE1A76BC;
	Mon, 27 Jan 2025 21:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="3PKolcEy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bz+FYU/R"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC82748D;
	Mon, 27 Jan 2025 21:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738012876; cv=none; b=REeqXECjD3BvwDDLyfZnkNmzkI3qeaTWIgREA1+I6rZoNYXY2U5ei75oF1H1c+Z8XZpTU2EB8KSue1hpQVpc4zfXabjvs+K97KZ/V5SZr9ywuIlIHlunsX6ov7/crQpeas+DsrjrlPaBIO0iAUDVn9GC0f1u1o+2lwK0gbRJryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738012876; c=relaxed/simple;
	bh=0b/fo0yI52aIyVI38HXgA6loIx7ZP7HGYMG7pW77FOo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WRatlcHcBp3jOiEfM8sBZCq5/IU2FXpJqxBVy7TrT+lfsnIn/j/WpYrjaEn8gkytM2Td7TmEPviWCy+oA1ReUng5thBobOQrTy/Cm3Fucta5gXY3QHoN3mBwM/Uv0qXFJnO0YfIIiF3HlrPutRvTBVP1G1hD9yN8B9wADKY/yS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=3PKolcEy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bz+FYU/R; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 41E5A1380B4C;
	Mon, 27 Jan 2025 16:21:12 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 27 Jan 2025 16:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738012872;
	 x=1738099272; bh=2zJxbQQBsfzQs1lWLDT7LyQftL6HYC6qxDKNVzdJCXM=; b=
	3PKolcEysBwaCmAKKQZbDdKxBGCyzhIIAEuZ0T2hMLDmBiezj994EZUqml5YqzK8
	yD8MCb/+H0whyCA/VkJ3iERpRoM2lPy9fb594J549Dv1oOV7HcFvSqOwM7+pqWqn
	Qkgp7/zxSyFc8aQZj5ievw6MakxS9NU5LtKQAszDtNNjEVDCk7qFi+SpgBVrpxw8
	sblZJhnXVvJ5YwGxruc4Qm0sa0E4kY6AUQ1m+Eqn+sX9Hu4LNJ5W1dSqT21GIOy0
	Vs/nhEkvE7XHydn2sDlT8olAaTeEWAMf+lsPjDZTRnp4Ryv6PN6ZW2MDfHjIra9z
	Guk5T5r/u+NtRZNbYMk5Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738012872; x=
	1738099272; bh=2zJxbQQBsfzQs1lWLDT7LyQftL6HYC6qxDKNVzdJCXM=; b=b
	z+FYU/RS9Gp3Q4LeilbR8eX0W1TKikJouW5kEug1vxj10iP+12etTHQMyo3NYla3
	F/8XjkcEP69jfkzzC+jMDIYiRqNOsFJD+K/FFFiBfkgF62XxUf8ifpupojeqC2PZ
	sjhq64DVo+3LKo4oiu1jup3g6omZSbaSigo37FCdIAQpgzpzutUQ+LcwqqLwft5j
	vrEs7mIJMlrQ0ho3BZNCwoinU8HabSOIlrhEorZluPEWfBL1puNT3m0yrvt7iFUv
	tpJ6MogFYmfgXdYw7BQn3RopYfloGsnLJujVXs3M3Qq3JdRSNsDslFy4o2syDPW7
	AG42A+7d+I3tsbGpOszjw==
X-ME-Sender: <xms:x_iXZzx_YU5nMqyt-sB1tuijwIIJKkibpY8H5ivW83IBU0QYuWhvcQ>
    <xme:x_iXZ7QwGZNJmDqot3rJOELmByrdLbCzHe6xPZh5mHHS1_0MggQ-0BqFPOq92r_rW
    ODFFa0INO5JXSDuQYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudegvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphh
    grrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjvghffhiguhestghhrhhomhhiuhhm
    rdhorhhgpdhrtghpthhtohepihhsmhdrhhhonhhgsehgmhgrihhlrdgtohhmpdhrtghpth
    htoheptghgiihonhgvshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepsghr
    rghunhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqd
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghm
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:x_iXZ9XMyzgqszbtH860qupsYs6Oo6eav6vr0Img9C4fdAweb1Py_w>
    <xmx:x_iXZ9gADRhBsaiXQZ3m27Z_K0z687EBZVt0kdNRhLTcsj062bnE8Q>
    <xmx:x_iXZ1Awrz872-GTfjt9qdkRf3PEtH3Hb1ws8aXgRiB37E-Sfq41-g>
    <xmx:x_iXZ2IOpu2BNwZPZQPjEydWSjG96Lvw7kvQSUTNlR21jLjf0-xBPQ>
    <xmx:yPiXZ52Ui-tCy7gFNjeBL9un5IWSMnDZGYQZCR2fMKmyPg3KwhRCgmhJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1D54A2220072; Mon, 27 Jan 2025 16:21:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 22:20:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ism Hong" <ism.hong@gmail.com>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Christian Brauner" <brauner@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Jeff Xu" <jeffxu@chromium.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>
Message-Id: <5427df64-658d-4377-89be-963ee7bb68ee@app.fastmail.com>
In-Reply-To: <20250106115227.1365643-1-ism.hong@gmail.com>
References: <20250106115227.1365643-1-ism.hong@gmail.com>
Subject: Re: [PATCH] mips: fix shmctl/semctl/msgctl syscall for o32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2025, at 12:52, Ism Hong wrote:
> The commit 275f22148e87 ("ipc: rename old-style shmctl/semctl/msgctl
> syscalls") switched various architectures to use sys_old_*ctl() with
> ipc_parse_version, including mips n32/n64. However, for mips o32, commit
> 0d6040d46817 ("arch: add split IPC system calls where needed") added
> separate IPC syscalls without properly using the old-style handlers.
>
> This causes applications using uClibc-ng to fail with -EINVAL when
> calling semctl/shmctl/msgctl with IPC_64 flag, as uClibc-ng uses the
> syscall numbers from kernel headers to determine whether to use the IPC
> multiplexer or split syscalls. In contrast, glibc is unaffected as it
> uses a unified feature test macro __ASSUME_DIRECT_SYSVIPC_SYSCALLS
> (disabled for mips-o32) to make this decision.
>
> Fix this by switching the o32 ABI entries for semctl, shmctl and msgctl
> to use the old-style handlers, matching the behavior of other
> architectures and fixing compatibility with uClibc-ng.
>
> Signed-off-by: Ism Hong <ism.hong@gmail.com>

I just saw this making it into mainline and had another look, sorry
I hadn't caught it earlier.

It was an intentional decision to use the new-style IPC_64
semantics on architectures that didn't already have the
separate system call.

You may not like that choice, but it's been done this way
for seven years now, and as far as I can tell, glibc relies
on this behavior.

I think this commit should be reverted, and uclibc be changed
to implement the kernel ABI for these syscalls.

      Arnd

