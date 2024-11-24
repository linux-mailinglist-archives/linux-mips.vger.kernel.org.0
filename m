Return-Path: <linux-mips+bounces-6792-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030259D6C9C
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2024 05:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16282814FF
	for <lists+linux-mips@lfdr.de>; Sun, 24 Nov 2024 04:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD27DBA2E;
	Sun, 24 Nov 2024 04:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="PY6ucCr6"
X-Original-To: linux-mips@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC8817
	for <linux-mips@vger.kernel.org>; Sun, 24 Nov 2024 04:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732423016; cv=none; b=cgzKUczQ+CRb8R70P8/V3vcXnROilFZPsIonx+/8iGLdIjpDZt/FiTsUwk94jd4K8+b+ibB5C7SiRAE2WySnQ5mvhS0tIFewQCTOpER+H+mP7Aqvn5UrdoNqZFBLNh2xGjFrIKx0XftbgCe82YKgoIpBIYwSI5+LuaYd+CzNoQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732423016; c=relaxed/simple;
	bh=WOMLtPo1ORSqCzIDxMpIy4jkOe+gpuz6kwab9bq63vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hu0Hagnb0KRXHx34mmobkYExR0Ib86Rmrf4m4prHGjWKOrgtgpCMtXP2fi9u9M0+mjS/eitBMkNIq+wFviiB+SG8AfQSQ4x3zGvLj+LDPhDZX9TixjykawcVYbpb7PraJ0aR3zJmQog1+FGHTkkZ0GgNAI7cQwbfGOE3m6fdIjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=PY6ucCr6; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=sIbKm6CVchX5xQQsEy+sZu5YyTg0C4cDS3Bj2HefZqk=; b=PY6ucCr6sxF9NozSxpVFujUZU8
	y1EKDQbTw9WM4Scj7HJ+pLck+aJK+tx2iUAeFTuQfNUpA8+WV8ExHAlBbpiQsvQX4+ivCALo2OwF6
	HG3qGEVqT0P1hUmFJGO9FpjwHP5Vr1HuGXjvp7CB9JsBt/d0OBCZmGWmWdSjfXyGfWxpMS116XxQc
	uAjKkQrx13oKasSoi9Rm5Eo+tKe560hTi70IVhtcwJAwHUrp+QivWg+zUfPAgLxHYVfcbx5dfDRHT
	y+W42IvXQ/8ZepXynr1ljXXy9eWlmslU+YaJZHsrL2HpgeZxE6IR+VSDUrTn9kj5zIrGLmtVz1ibs
	41zWVnjA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tF4Md-000000013CY-3B0A;
	Sun, 24 Nov 2024 04:36:51 +0000
Date: Sun, 24 Nov 2024 04:36:51 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-mips@vger.kernel.org
Cc: Paul Burton <paulburton@kernel.org>
Subject: [now with correct Cc] [RFC] weirdness in "MIPS: ptrace: introduce
 NT_MIPS_MSA regset"
Message-ID: <20241124043651.GA250598@ZenIV>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Al Viro <viro@ftp.linux.org.uk>

	Both msa_get() and msa_set() have very odd logics:

	} else if (sizeof(target->thread.fpu.fpr[0]) == regset->size) {

and

	if (sizeof(target->thread.fpu.fpr[0]) == regset->size) {

resp.

These instances occur in mips_regsets[REGSET_MSA] and in mips64_regsets[REGSET_MSA]
and both have ->size set to 16.  Fair enough, we are dealing with 128bit elements.

Now, the type of target->thread.fpu.fpr[0] is always union fpureg, i.e.

union fpureg {
        __u32   val32[FPU_REG_WIDTH / 32];
	__u64   val64[FPU_REG_WIDTH / 64];
};

and both members have the same size - FPU_REG_WIDTH / 8, now as well as at the
time this commit went in.  FPU_REG_WIDTH definition, now as then, is
#ifdef CONFIG_CPU_HAS_MSA
# define FPU_REG_WIDTH  128
#else
# define FPU_REG_WIDTH  64
#endif

Both msa_get() and msa_set() are under ifdef CONFIG_CPU_HAS_MSA.  In other words,
they are only going to be compiled if FPU_REG_WIDTH is 128 and sizeof(union fpreg)
is 16.

So it looks like both checks are constant true.  What am I missing here?

