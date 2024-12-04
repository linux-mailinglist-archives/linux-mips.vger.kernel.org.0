Return-Path: <linux-mips+bounces-6863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8779E3DDF
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 16:10:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 976EAB35E87
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 14:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A14B20898A;
	Wed,  4 Dec 2024 14:33:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AEC1FCF72;
	Wed,  4 Dec 2024 14:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733322836; cv=none; b=D4KnhWCKGqlVmxGvOdn4myzw+ikacQYVaA1SvwZkZv0jSMUV0vhPNH29B4n0FhsI7Lphi9VPARhvPjv+gqfDbEhEDrpbcQmSwSTx9KInJ+aOaalb9rnAEOhuTpBlrgos7c+VyCuMrYaXSnELUaASLWK6OBR+ZICOslJSjsoQhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733322836; c=relaxed/simple;
	bh=e+EeB1yI2myFGufwmJebA0r2Pa27k1BvLSbPOEKQS/4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0/t+lLVd+Xds6XHyWBMkngPRmN7xIxqA1QWZbjOpAn6YroxYjjrMpUhinZpL9+6pdNkPfnIftPIeOft13jzO1mZClIOrCWh7SaJxlmtlpO6qTNoHmOnt1ZMEi0uZNPeJNgQ3Y5tT4p9elkXZIJsH0GaldvgJkoCLPDjaLDsp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A39FC4CECD;
	Wed,  4 Dec 2024 14:33:53 +0000 (UTC)
Date: Wed, 4 Dec 2024 09:33:56 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Joel Fernandes <joel@joelfernandes.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Paul Burton
 <paulburton@kernel.org>
Subject: Re: [PATCH v2] tracing: Remove definition of trace_*_rcuidle()
Message-ID: <20241204093356.2d578657@gandalf.local.home>
In-Reply-To: <60749a43-17ad-4491-a13f-a2db7b6cb00c@paulmck-laptop>
References: <20241003181629.36209057@gandalf.local.home>
	<bddb02de-957a-4df5-8e77-829f55728ea2@roeck-us.net>
	<20241203155542.462b1b21@gandalf.local.home>
	<ee401848-f7a1-4877-b896-36bec32ca985@roeck-us.net>
	<20241203220153.3f81f12b@gandalf.local.home>
	<60749a43-17ad-4491-a13f-a2db7b6cb00c@paulmck-laptop>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Dec 2024 21:01:59 -0800
"Paul E. McKenney" <paulmck@kernel.org> wrote:

> > Paul?  
> 
> Looks plausible to me, though I don't understand why the introduction
> of trace() doesn't permit removal of the corresponding current code.
> (Or did I miss a previous patch that did just that?)
> 

I removed the trace_*_rcuidle() code, but this file still used it. I didn't
realize that removing the trace_*_rcuidle() in this file would break other
architectures.

This patch is a work around to not need to re-introduce the
trace_*_rcuidle() code.

-- Steve

