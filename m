Return-Path: <linux-mips+bounces-5716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B879885FB
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 15:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71A04B210BA
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 13:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BEF18E053;
	Fri, 27 Sep 2024 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlRmnIAq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E82118E03B;
	Fri, 27 Sep 2024 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727442014; cv=none; b=NRtkSOYPXRglhjkXfjnwkiayuNjCg1Ar60riLJlW9HsDFbPXMuFhT9aJfW6OfjNKzrV/liYrF2hEmA6Wtckj5YNJnmsetOhBkii2+e3Y4rqty+JDaEuD3Z8UWOQZ0t7QGcgOlvjMlDZbSLX6TgJlULEv4623luBT9sHnPYFvSFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727442014; c=relaxed/simple;
	bh=8ffG0XGN5QAI3Rj6SPj6yBv2d+VMVe5C/ENaRffYsQ4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=QHLuHBlGmeIIK5ZAXYtRjxfdq1yNKAPtlY4X0DZ8ZEV8BGwo5JzZqjw0lb05y664LkEOMzEw6TIRrwFyTwH4CPBCSptF3Cl6r+rhllpgoIZTSBdtX0UMvwBNH+OwrMRGkyHdVMrM0M639h/yZtgGybCuSaBqN/xHApXf0jA19So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlRmnIAq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C385AC4CEC4;
	Fri, 27 Sep 2024 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727442013;
	bh=8ffG0XGN5QAI3Rj6SPj6yBv2d+VMVe5C/ENaRffYsQ4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=rlRmnIAqwq70DPQdgXF6jQju3Spn2CYQkbcCTHe0ArePJrTPFZfkwMrnxn/g4QK+f
	 PJ6NlxZ0wgbjjT1fnEV1NFaagfN5WJYggbK22cVJJrswoA+mmVisIY8sk6H8+7lInF
	 k+K+dy4VD+Lz6fqbIIl5nZYBOSXuVHNM1uNcdeskzaTAd+A0A0cPM7TATNlFnPNjvL
	 jeLU9juJFTK/EM2G7HclCJTU1h0KROGay+YOdpyV/zE8Mdcp84kNIJ65MLaPIceSad
	 kPdqI0Me1xxbQuQ1xMB0XYQt9XZzLZ7T7rp2n7yEEu5kFPL1e8e5u3TinktkXz0RKn
	 F1BoksI4LWjXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 75E153809A80;
	Fri, 27 Sep 2024 13:00:17 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: helpdesk@kernel.org, linux-mips@vger.kernel.org, 
 linux-hams@vger.kernel.org, macro@orcam.me.uk, 
 konstantin@linuxfoundation.org, dan.carpenter@linaro.org
Message-ID: <20240927-b219329-030e69c334a2@bugzilla.kernel.org>
In-Reply-To: <f74c4234-a091-4cc3-b92b-469f506c16a5@stanley.mountain>
References: <f74c4234-a091-4cc3-b92b-469f506c16a5@stanley.mountain>
Subject: Re: Bouncing maintainer: Ralf Baechle
X-Bugzilla-Product: kernel.org
X-Bugzilla-Component: Helpdesk
X-Mailer: bugspray 0.1-dev
Date: Fri, 27 Sep 2024 13:00:17 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219329

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)


