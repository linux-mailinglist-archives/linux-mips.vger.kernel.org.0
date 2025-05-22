Return-Path: <linux-mips+bounces-9068-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86739AC0C96
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 15:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62E099E2884
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 13:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5FA28BA84;
	Thu, 22 May 2025 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+l2hXfl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044E928BA98
	for <linux-mips@vger.kernel.org>; Thu, 22 May 2025 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920158; cv=none; b=JcWCzUwrpSjVI9GaU6II9EoUkCECSMf0sNLjL9zUyYG0j9U4zg8b3frqPtGCqm9XJpnxDHjIy0CUXP35FyA2LJhIxO0Ig164xgXpwgnRqZuJs028kjU0k951nV8NP5ZaZpOY/KK3GMnKHRayalp9hjoK1DTqwheQvUodjSXycGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920158; c=relaxed/simple;
	bh=9d/cL7spZ/Wpwt5q//l/yGfX4IJgepMQQJ1VLqzbCYI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MMgbEqmO3u3BKrlXkqKkDpF2zOSKuYjXX3aR1+Web24Hup/BGaXOoG0+6L8TJzLfgi+fZG/3Y3AABW64SFwZcJamjvXBlkJ54qCAeBqJRL6V5/yLq4DBcFzpJJuocfVH6OlUoNxSaqdRvod4Rj+zGJjmXMDVsHhMIP2aqNtUT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+l2hXfl; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d96d16b369so65719375ab.0
        for <linux-mips@vger.kernel.org>; Thu, 22 May 2025 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747920156; x=1748524956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZfTBhDhdrqletUuYxc3+baMCOgR/beos1y6YIz7hWx4=;
        b=Z+l2hXflKb1u7I72jkl+1PM6xPzUcnronGG2UZ44dDS9iuxhOshD3AlpWMI3Jh11+R
         6DECOkjeWnNl4rOznD1Z00eaUP5OU9khVHTayWnJluCUeuc/dkFWlgeMYkiCwtDQnhEZ
         2/MtVK2S6FaqUwMT6Go/WvYI/3yZlcZ6STFxXosIR0mdDVmut0eiJxkY0sCAT2uWX/9C
         gzuMuDOTOmxyhr+ncuhaVsUl+yd7mntCmuHFhzhFq0Z4n8udYDaQnqH17/qoafy1DIH/
         d8r3i2XgZHamMU3U/YEzHwIX8v07z3Yhv7lA+kjTXIqVh4O/iInrRC+V3DOSWDgXlcUY
         1+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920156; x=1748524956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfTBhDhdrqletUuYxc3+baMCOgR/beos1y6YIz7hWx4=;
        b=eFqhDNsspkNmXAEJTUDGqy2gy0zbDowwDZoYyW1p0XNb9aKDnNYrc96OnTz1MU7r1f
         gZkqf8y0Q9K9rVMR6ueGGbhyDGqGNdfMREr8O1S9FadkUlfxZqt86vrwmSJdKarmAx5l
         0X5kX7bgQJx1tAvjdax1M7Zzaadtlrc5heDGUP+Mr6XEh4J409hECZezYtnp1J/gr0A2
         HTweADvvJAQjqT2WRqXgF4TiGed+zf7iWV4gKyu3kU0eUYxiLl0kZ4AQpGL8zbytVhSF
         HQTKRqXvZtXXH/gsaNRlwNcVANmhVFRFIdD4n95V7ZF2qCPp35QVGfSAXiAA31XyKacZ
         17Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVds9br7idYeeXmkV9Zoo7NRl4gBczunMMuz18yuVqUWoZn6d2E7ukKfpbWgKGgdzxJ0IFiA++GaCou@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7iw9zAS6BPjG405LrUQFbaE2JYOwH0qTBZOj02R57PjNBVGzo
	Fu3uHzPRQspnnL0OyFWe5okgklNnZMgl/jXT/7Qxes99m3C+bQxvJevPgK5fW/TMUPIjXkekpLo
	nUnglZGZaXrEK3rHe8sC9Hx1EbxySr580CbYK6d9LJZxRRLsMO1QPOfg=
X-Gm-Gg: ASbGncsYzI1ZhcK1bW3qQgQjg0IWAmSzJUa+U1SfXzjSWR9W5ABSCKNUF/Frvc4EPg7
	GqjJYVde9d8E8sC3UNSvuvN0kQSsQhkqzRxDygw+C9l4y+duWXg9uQBgPn58gtVvR3p46H2v5zS
	RAEPQByuIoBQqjelMUKjIojWzDa+FT/KSLwy1NnjDZ+RgMqyMOJv5QHrwfdXObonc3Eg==
X-Google-Smtp-Source: AGHT+IH2x7M+ebP0fF6u65wtIJfC2HKWreUBC1mFxNZYez5c2LjS+RbEJT03nVtElBzCk2DLszkS0XUj8hnQ/3AfrTc=
X-Received: by 2002:a05:6902:13c6:b0:e74:b106:ec71 with SMTP id
 3f1490d57ef6-e7b6a317681mr31915653276.46.1747920145756; Thu, 22 May 2025
 06:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:52:13 +0530
X-Gm-Features: AX0GCFs4fMOBdKUjtk4Ii_YEa3Zj0uO_GBWF7untQbLfXNpr8KzqJEF5L9aKhfg
Message-ID: <CA+G9fYsZPSJ55FQ9Le9rLQMVHaHyE5kU66xqiPnz6mmfhvPfbQ@mail.gmail.com>
Subject: mips gcc-12 malta_defconfig 'SOCK_COREDUMP' undeclared (first use in
 this function); did you mean 'SOCK_RDM'?
To: linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on mips malta_defconfig build failed with gcc-12 on the Linux next
tag next-20250521 and next-20250522.

First seen on the next-20250521
 Good: next-20250516
 Bad:  next-20250521

Regressions found on mips:
 - build/gcc-12-malta_defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: mips gcc-12 malta_defconfig 'SOCK_COREDUMP'
undeclared (first use in this function); did you mean 'SOCK_RDM'?

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
net/unix/af_unix.c: In function 'unix_find_bsd':
net/unix/af_unix.c:1152:21: error: 'SOCK_COREDUMP' undeclared (first
use in this function); did you mean 'SOCK_RDM'?
 1152 |         if (flags & SOCK_COREDUMP) {
      |                     ^~~~~~~~~~~~~
      |                     SOCK_RDM

fs/coredump.c: In function 'do_coredump':
fs/coredump.c:899:64: error: 'SOCK_COREDUMP' undeclared (first use in
this function); did you mean 'SOCK_RDM'?
  899 |                                         addr_len, O_NONBLOCK |
SOCK_COREDUMP);
      |
^~~~~~~~~~~~~
      |                                                                SOCK_RDM
fs/coredump.c:899:64: note: each undeclared identifier is reported
only once for each function it appears in
make[4]: *** [scripts/Makefile.build:203: fs/coredump.o] Error 1


## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28516701/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28516701/suite/build/test/gcc-12-malta_defconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9ld0H5IJGyGHQxUSopFLZrU/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9ld0H5IJGyGHQxUSopFLZrU/config


--
Linaro LKFT
https://lkft.linaro.org

